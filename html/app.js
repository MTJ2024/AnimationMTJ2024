/**
 * ============================================================
 *   AnimationMTJ2024 © 2024 MTJ2024 | All Rights Reserved
 *   Unauthorized redistribution is strictly prohibited.
 * ============================================================
 */

'use strict';

/* ── FiveM resource name helper ─────────────────────────────── */
function getResourceName() {
    return (typeof window.GetParentResourceName === 'function')
        ? window.GetParentResourceName()
        : 'AnimationMTJ2024';
}

/* ── State ──────────────────────────────────────────────────── */
const state = {
    categories:     [],
    quickbar:       Array(5).fill(null),
    activeCategory: null,   // null = "Alle"
    currentDict:    null,
    currentAnim:    null,
    ctxTarget:      null,
};

/* ── DOM refs – Side Panel ──────────────────────────────────── */
const el = {
    panel:       document.getElementById('side-panel'),
    spClose:     document.getElementById('sp-close'),
    spSearch:    document.getElementById('sp-search'),
    spSearchClr: document.getElementById('sp-search-clear'),
    spCats:      document.getElementById('sp-cats'),
    spCatTitle:  document.getElementById('sp-cat-title'),
    spAnimCount: document.getElementById('sp-anim-count'),
    spList:      document.getElementById('sp-list'),
    spEmpty:     document.getElementById('sp-empty'),
    spStop:      document.getElementById('sp-stop'),
    ctxMenu:     document.getElementById('context-menu'),
};

/* ════════════════════════════════════════════════════════════
   NUI message handler
   ════════════════════════════════════════════════════════════ */
window.addEventListener('message', ({ data }) => {
    switch (data.action) {

        case 'openMenu':
            state.categories     = data.categories  || [];
            state.quickbar       = data.quickbar     || Array(5).fill(null);
            state.currentDict    = data.currentDict  || null;
            state.currentAnim    = data.currentAnim  || null;
            openPanel();
            break;

        case 'closeMenu':
            closePanelLocal();
            break;

        case 'initQuickbar':
            state.quickbar = data.quickbar || Array(5).fill(null);
            break;

        case 'animPlaying':
            state.currentDict = data.dict;
            state.currentAnim = data.anim;
            syncPlayingUI();
            break;

        case 'animStopped':
            state.currentDict = null;
            state.currentAnim = null;
            syncPlayingUI();
            break;

        case 'openWheel':
            state.categories  = data.categories  || state.categories;
            state.quickbar    = data.quickbar     || state.quickbar;
            state.currentDict = data.currentDict  || null;
            state.currentAnim = data.currentAnim  || null;
            openWheel();
            break;

        case 'closeWheel':
            closeWheelLocal();
            break;
    }
});

/* ════════════════════════════════════════════════════════════
   Side Panel open / close
   ════════════════════════════════════════════════════════════ */
function openPanel() {
    state.activeCategory = null;
    el.spSearch.value = '';
    el.spSearchClr.style.display = 'none';
    renderCategories();
    renderList();
    el.panel.classList.remove('sp-hidden');
    setTimeout(() => el.spSearch.focus(), 80);
}

function closePanelLocal() {
    el.panel.classList.add('sp-hidden');
    el.spSearch.value = '';
    el.spSearchClr.style.display = 'none';
    hideCtxMenu();
}

function closePanelNUI() {
    closePanelLocal();
    nuiFetch('closeMenu', {});
}

/* ════════════════════════════════════════════════════════════
   Render categories as horizontal pill tabs
   ════════════════════════════════════════════════════════════ */
function renderCategories() {
    el.spCats.innerHTML = '';

    const totalCount = state.categories.reduce((n, c) => n + (c.anims?.length ?? 0), 0);
    el.spCats.appendChild(makeCatPill(null, '✨ Alle', totalCount));

    for (const cat of state.categories) {
        el.spCats.appendChild(makeCatPill(cat.id, cat.label, cat.anims?.length ?? 0));
    }
}

function makeCatPill(id, label, count) {
    const btn = document.createElement('button');
    btn.className = 'sp-cat' + (state.activeCategory === id ? ' active' : '');
    btn.dataset.id = id ?? '__all__';
    btn.textContent = label;
    btn.title = `${count} Animation${count !== 1 ? 'en' : ''}`;
    btn.addEventListener('click', () => selectCategory(id));
    return btn;
}

function selectCategory(id) {
    state.activeCategory = id;
    el.spSearch.value = '';
    el.spSearchClr.style.display = 'none';
    renderCategories();
    renderList();
}

/* ════════════════════════════════════════════════════════════
   Render animation list as rows
   ════════════════════════════════════════════════════════════ */
function renderList(term = '') {
    el.spList.innerHTML = '';
    const query = term.toLowerCase().trim();

    let list = [];

    if (state.activeCategory === null) {
        for (const cat of state.categories) {
            for (const a of (cat.anims ?? [])) {
                list.push({ ...a, catLabel: cat.label });
            }
        }
        el.spCatTitle.textContent = query ? `Suche: „${term}"` : 'Alle Animationen';
    } else {
        const cat = state.categories.find(c => c.id === state.activeCategory);
        if (cat) {
            list = (cat.anims ?? []).map(a => ({ ...a, catLabel: cat.label }));
            el.spCatTitle.textContent = cat.label;
        }
    }

    if (query) {
        list = list.filter(a => a.label.toLowerCase().includes(query));
    }

    el.spAnimCount.textContent = list.length ? `${list.length}` : '';

    if (list.length === 0) {
        el.spEmpty.classList.remove('hidden');
        el.spList.style.display = 'none';
        return;
    }

    el.spEmpty.classList.add('hidden');
    el.spList.style.display = '';

    for (const anim of list) {
        el.spList.appendChild(makeRow(anim));
    }
}

function makeRow(anim) {
    const row = document.createElement('div');
    row.className = 'sp-row';
    row.dataset.dict  = anim.dict;
    row.dataset.anim  = anim.anim;
    row.dataset.flag  = anim.flag ?? 1;
    row.dataset.label = anim.label;

    if (state.currentDict === anim.dict && state.currentAnim === anim.anim) {
        row.classList.add('playing');
    }

    row.innerHTML = `
        <span class="sp-row-icon">${pickEmoji(anim.label, anim.catLabel)}</span>
        <span class="sp-row-label">${anim.label}</span>
        <span class="sp-row-dot"></span>
    `;

    row.addEventListener('click',       () => onRowClick(anim));
    row.addEventListener('contextmenu', (e) => onRowRightClick(e, anim));
    return row;
}

/* ════════════════════════════════════════════════════════════
   Play / stop
   ════════════════════════════════════════════════════════════ */
function onRowClick(anim) {
    if (state.currentDict === anim.dict && state.currentAnim === anim.anim) {
        doStopAnim();
    } else {
        doPlayAnim(anim.dict, anim.anim, anim.flag ?? 1);
    }
}

function doPlayAnim(dict, anim, flag) {
    nuiFetch('playAnim', { dict, anim, flag: flag ?? 1 });
    state.currentDict = dict;
    state.currentAnim = anim;
    syncPlayingUI();
}

function doStopAnim() {
    nuiFetch('stopAnim', {});
    state.currentDict = null;
    state.currentAnim = null;
    syncPlayingUI();
}

function syncPlayingUI() {
    document.querySelectorAll('.sp-row').forEach(r => {
        r.classList.toggle('playing',
            r.dataset.dict === state.currentDict &&
            r.dataset.anim === state.currentAnim);
    });
    syncWheelPlaying();
}

/* ════════════════════════════════════════════════════════════
   Quickbar – internal state only, no on-screen bar
   ════════════════════════════════════════════════════════════ */
function renderQuickbar() {
    // Quickbar is off-screen; state is kept for Numpad key support.
}

/* ════════════════════════════════════════════════════════════
   Emoji helper
   ════════════════════════════════════════════════════════════ */
function pickEmoji(label = '', catLabel = '') {
    const t = (label + ' ' + catLabel).toLowerCase();
    if (/dance|tanz|club/.test(t))               return '🕺';
    if (/yoga/.test(t))                          return '🧘';
    if (/push.up|liegestütz/.test(t))            return '🤸';
    if (/sit.up/.test(t))                        return '🏋️';
    if (/flex/.test(t))                          return '💪';
    if (/jog|jogg/.test(t))                      return '🏃';
    if (/sitz|picnic|boden/.test(t))             return '🪑';
    if (/lieg|sunbath|sonnen/.test(t))           return '☀️';
    if (/rauch|smok/.test(t))                    return '🚬';
    if (/trink|drink/.test(t))                   return '🍺';
    if (/essen|eat/.test(t))                     return '🍽️';
    if (/telefon|phone|film/.test(t))            return '📱';
    if (/chill|hang|lean|lehr/.test(t))          return '😎';
    if (/jubel|cheer/.test(t))                   return '🎉';
    if (/klatsch|clap/.test(t))                  return '👏';
    if (/wink/.test(t))                          return '👋';
    if (/zeig|point/.test(t))                    return '👉';
    if (/daumen.hoch|thumb.*up/.test(t))         return '👍';
    if (/daumen.runter|thumb.*down/.test(t))     return '👎';
    if (/kopf|nod/.test(t))                      return '🙂';
    if (/erschreck|shock/.test(t))               return '😱';
    if (/gelangweilt|bored/.test(t))             return '😴';
    if (/lach|laugh/.test(t))                    return '😂';
    if (/rock/.test(t))                          return '✊';
    if (/paper|papier/.test(t))                  return '✋';
    if (/schere|scissors/.test(t))               return '✌️';
    if (/untersuchen|invest/.test(t))            return '🔍';
    if (/schweiß|weld/.test(t))                  return '🔧';
    if (/klemmbrett|clipboard/.test(t))          return '📋';
    if (/beten|pray/.test(t))                    return '🙏';
    if (/schreib|pc|office/.test(t))             return '💻';
    return '🎭';
}

/* ════════════════════════════════════════════════════════════
   Context menu (right-click → assign quickbar slot)
   ════════════════════════════════════════════════════════════ */
function onRowRightClick(e, anim) {
    e.preventDefault();
    state.ctxTarget = anim;
    buildCtxMenu();
    const x = Math.min(e.clientX, window.innerWidth  - 220);
    const y = Math.min(e.clientY, window.innerHeight - 220);
    el.ctxMenu.style.left    = x + 'px';
    el.ctxMenu.style.top     = y + 'px';
    el.ctxMenu.style.display = 'block';
}

function hideCtxMenu() {
    el.ctxMenu.style.display = 'none';
    state.ctxTarget = null;
}

function buildCtxMenu() {
    const slots = [1,2,3,4,5].map(i => `
        <div class="ctx-item" data-slot="${i - 1}">
            <span>⚡</span> Slot ${i} belegen
        </div>
    `).join('');

    el.ctxMenu.innerHTML = `
        <div class="ctx-label">Schnellzugriff (NUM)</div>
        ${slots}
        <hr class="ctx-divider">
        <div class="ctx-item ctx-play" id="ctx-play-btn">
            <span>▶️</span> Jetzt abspielen
        </div>
    `;

    el.ctxMenu.querySelectorAll('[data-slot]').forEach(item => {
        item.addEventListener('click', () => assignToQuickbar(parseInt(item.dataset.slot)));
    });

    document.getElementById('ctx-play-btn').addEventListener('click', () => {
        if (state.ctxTarget) doPlayAnim(state.ctxTarget.dict, state.ctxTarget.anim, state.ctxTarget.flag ?? 1);
        hideCtxMenu();
    });
}

function assignToQuickbar(index) {
    const anim = state.ctxTarget;
    if (!anim) return;
    state.quickbar[index] = { label: anim.label, dict: anim.dict, anim: anim.anim, flag: anim.flag ?? 1 };
    nuiFetch('setQuickbar', { slot: index + 1, label: anim.label, dict: anim.dict, anim: anim.anim, flag: anim.flag ?? 1 });
    hideCtxMenu();
}

/* ════════════════════════════════════════════════════════════
   Event listeners – Side Panel
   ════════════════════════════════════════════════════════════ */
el.spClose.addEventListener('click', closePanelNUI);
el.spStop.addEventListener('click', doStopAnim);

el.spSearch.addEventListener('input', e => {
    const v = e.target.value;
    el.spSearchClr.style.display = v ? 'block' : 'none';
    if (v && state.activeCategory !== null) {
        state.activeCategory = null;
        renderCategories();
    }
    renderList(v);
});

el.spSearchClr.addEventListener('click', () => {
    el.spSearch.value = '';
    el.spSearchClr.style.display = 'none';
    renderList();
    el.spSearch.focus();
});

document.addEventListener('keydown', e => {
    if (e.key === 'Escape') {
        if (wheelOpen) closeWheelNUI();
        else           closePanelNUI();
    }
});

document.addEventListener('click', e => {
    if (el.ctxMenu.style.display === 'block' && !el.ctxMenu.contains(e.target)) {
        hideCtxMenu();
    }
});

document.addEventListener('contextmenu', e => {
    if (!e.target.closest('.sp-row')) e.preventDefault();
});

/* ════════════════════════════════════════════════════════════
   NUI fetch wrapper
   ════════════════════════════════════════════════════════════ */
function nuiFetch(endpoint, data) {
    fetch(`https://${getResourceName()}/${endpoint}`, {
        method:  'POST',
        headers: { 'Content-Type': 'application/json' },
        body:    JSON.stringify(data ?? {}),
    }).catch(() => {});
}

/* ════════════════════════════════════════════════════════════
   ANIMATIONS-RAD (Wheel) – unverändert
   ════════════════════════════════════════════════════════════ */
const wEl = {
    overlay:  document.getElementById('wheel-overlay'),
    svg:      document.getElementById('wheel-svg'),
    center:   document.getElementById('wheel-center'),
    cIcon:    document.getElementById('wheel-center-icon'),
    cName:    document.getElementById('wheel-center-name'),
    panel:    document.getElementById('wheel-panel'),
    pIcon:    document.getElementById('wheel-panel-icon'),
    pTitle:   document.getElementById('wheel-panel-title'),
    pCount:   document.getElementById('wheel-panel-count'),
    pList:    document.getElementById('wheel-panel-list'),
    pEmpty:   document.getElementById('wheel-panel-empty'),
    qbSlots:  document.getElementById('wheel-qb-slots'),
};

let wheelOpen = false;

const W_PALETTE = [
    [139, 92, 246], [6, 182, 212], [168, 85, 247], [14, 165, 233],
    [124, 58, 237], [34, 211, 238], [109, 40, 217], [56, 189, 248],
    [153, 51, 255], [22, 193, 222], [99,  65, 240], [45, 212, 191],
];

function openWheel() {
    if (wheelOpen) return;
    wheelOpen = true;
    buildWheel();
    renderWheelQuickbar();
    wEl.overlay.classList.remove('hidden');
}

function closeWheelLocal() {
    wheelOpen = false;
    wEl.overlay.classList.add('hidden');
    wEl.panel.classList.add('wheel-panel-hidden');
    wEl.center.classList.remove('has-sel');
    wEl.cIcon.textContent = '🎭';
    wEl.cName.innerHTML   = 'Wähle<br>Kategorie';
    wEl.cName.style.color = '';
}

function closeWheelNUI() {
    closeWheelLocal();
    nuiFetch('closeWheel', {});
}

function syncWheelPlaying() {
    wEl.pList.querySelectorAll('.wheel-anim-item').forEach(item => {
        item.classList.toggle('playing',
            item.dataset.dict === state.currentDict &&
            item.dataset.anim === state.currentAnim);
    });
}

function buildWheel() {
    const svg  = wEl.svg;
    svg.innerHTML = '';
    const cats = state.categories;
    const N    = cats.length;
    if (!N) return;

    const CX = 250, CY = 250, R_OUT = 230, R_IN = 74, GAP = 0.038;

    cats.forEach((cat, i) => {
        const [r, g, b] = W_PALETTE[i % W_PALETTE.length];
        const startA = (i / N) * 2 * Math.PI - Math.PI / 2 + GAP / 2;
        const endA   = ((i + 1) / N) * 2 * Math.PI - Math.PI / 2 - GAP / 2;
        const midA   = (startA + endA) / 2;
        const large  = (endA - startA > Math.PI) ? 1 : 0;

        const px = (R, a) => (CX + R * Math.cos(a)).toFixed(2);
        const py = (R, a) => (CY + R * Math.sin(a)).toFixed(2);

        const d = [
            `M${px(R_OUT, startA)} ${py(R_OUT, startA)}`,
            `A${R_OUT} ${R_OUT} 0 ${large} 1 ${px(R_OUT, endA)} ${py(R_OUT, endA)}`,
            `L${px(R_IN, endA)} ${py(R_IN, endA)}`,
            `A${R_IN} ${R_IN} 0 ${large} 0 ${px(R_IN, startA)} ${py(R_IN, startA)}Z`,
        ].join(' ');

        const path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
        path.setAttribute('d', d);
        path.setAttribute('data-idx', i);
        path.setAttribute('data-r', r);
        path.setAttribute('data-g', g);
        path.setAttribute('data-b', b);
        path.style.cssText = [
            `fill:rgba(${r},${g},${b},0.20)`,
            `stroke:rgba(${r},${g},${b},0.38)`,
            'stroke-width:1.5',
            'cursor:pointer',
            'transition:fill .18s,filter .18s',
        ].join(';');
        path.addEventListener('mouseenter', () => onWheelHover(i));
        svg.appendChild(path);

        const LR = (R_OUT + R_IN) / 2;
        const lx = +px(LR, midA), ly = +py(LR, midA);
        const si    = cat.label.search(/\s/);
        const icon  = si > -1 ? cat.label.slice(0, si) : '��';
        const name  = si > -1 ? cat.label.slice(si + 1) : cat.label;
        const short = name.length > 10 ? name.slice(0, 9) + '…' : name;
        const fs    = N > 9 ? '8.5' : '9.5';

        const mkT = (txt, dy, sz, fill, fw) => {
            const t = document.createElementNS('http://www.w3.org/2000/svg', 'text');
            t.setAttribute('x', lx);        t.setAttribute('y', ly + dy);
            t.setAttribute('text-anchor', 'middle');
            t.setAttribute('dominant-baseline', 'middle');
            t.setAttribute('font-size', sz);
            t.setAttribute('fill', fill);
            t.setAttribute('font-weight', fw);
            t.setAttribute('font-family', "'Segoe UI', system-ui, sans-serif");
            t.setAttribute('pointer-events', 'none');
            t.textContent = txt;
            return t;
        };
        svg.appendChild(mkT(icon, -11, '20', 'rgba(255,255,255,0.90)', '400'));
        svg.appendChild(mkT(short,  13, fs,   `rgba(${r},${g},${b},1.0)`, '700'));
    });
}

function onWheelHover(idx) {
    wEl.svg.querySelectorAll('path[data-idx]').forEach(p => {
        const pi = +p.getAttribute('data-idx');
        const r  =  p.getAttribute('data-r');
        const g  =  p.getAttribute('data-g');
        const b  =  p.getAttribute('data-b');
        if (pi === idx) {
            p.style.fill   = `rgba(${r},${g},${b},0.65)`;
            p.style.filter = `drop-shadow(0 0 18px rgba(${r},${g},${b},0.85))`;
        } else {
            p.style.fill   = `rgba(${r},${g},${b},0.10)`;
            p.style.filter = '';
        }
    });

    const cat = state.categories[idx];
    if (!cat) return;
    const [cr, cg, cb] = W_PALETTE[idx % W_PALETTE.length];
    const si = cat.label.search(/\s/);
    wEl.cIcon.textContent  = si > -1 ? cat.label.slice(0, si) : '🎭';
    wEl.cName.textContent  = si > -1 ? cat.label.slice(si + 1) : cat.label;
    wEl.cName.style.color  = `rgba(${cr},${cg},${cb},0.9)`;
    wEl.center.classList.add('has-sel');

    showWheelPanel(idx);
}

function showWheelPanel(catIdx) {
    const cat = state.categories[catIdx];
    if (!cat) return;

    const [cr, cg, cb] = W_PALETTE[catIdx % W_PALETTE.length];
    const si = cat.label.search(/\s/);
    wEl.pIcon.textContent  = si > -1 ? cat.label.slice(0, si) : '🎭';
    wEl.pTitle.textContent = si > -1 ? cat.label.slice(si + 1) : cat.label;
    wEl.pTitle.style.color = `rgba(${cr},${cg},${cb},1.0)`;

    const anims = cat.anims ?? [];
    wEl.pCount.textContent = `${anims.length} Animation${anims.length !== 1 ? 'en' : ''}`;

    wEl.pList.innerHTML = '';
    wEl.pEmpty.style.display = anims.length ? 'none' : '';

    for (const anim of anims) {
        const playing = state.currentDict === anim.dict && state.currentAnim === anim.anim;
        const item = document.createElement('div');
        item.className = 'wheel-anim-item' + (playing ? ' playing' : '');
        item.dataset.dict = anim.dict;
        item.dataset.anim = anim.anim;
        item.innerHTML = `
            <span class="wheel-anim-icon">${pickEmoji(anim.label, cat.label)}</span>
            <span class="wheel-anim-label">${anim.label}</span>
            <span class="wheel-anim-dot"></span>
        `;
        item.addEventListener('click', () => {
            if (state.currentDict === anim.dict && state.currentAnim === anim.anim) {
                doStopAnim();
            } else {
                doPlayAnim(anim.dict, anim.anim, anim.flag ?? 1);
            }
            closeWheelNUI();
        });
        wEl.pList.appendChild(item);
    }
    wEl.panel.classList.remove('wheel-panel-hidden');
}

function renderWheelQuickbar() {
    wEl.qbSlots.innerHTML = '';
    state.quickbar.forEach((slot, i) => {
        const div = document.createElement('div');
        const active = slot?.dict && slot.dict === state.currentDict && slot.anim === state.currentAnim;
        div.className = 'wqb-slot' + (active ? ' active' : '');
        div.innerHTML = `
            <span class="wqb-key">NUM ${i + 1}</span>
            <span class="wqb-icon">${slot?.dict ? pickEmoji(slot.label) : '➕'}</span>
            <span class="wqb-name">${slot?.label ?? 'Leer'}</span>
        `;
        wEl.qbSlots.appendChild(div);
    });
}
