/**
 * ============================================================
 *   AnimationMTJ2024 © 2024 MTJ2024 | All Rights Reserved
 *   Unauthorized redistribution is strictly prohibited.
 * ============================================================
 */

'use strict';

/* ── Hilfsfunktion: FiveM-Ressourcenname ─────────────────────
   In FiveM steht window.GetParentResourceName() bereit.
   Fallback für lokale Entwicklung/Vorschau.               */
function getResourceName() {
    return (typeof window.GetParentResourceName === 'function')
        ? window.GetParentResourceName()
        : 'AnimationMTJ2024';
}

/* ── Daten-State ─────────────────────────────────────────────── */
const state = {
    categories:   [],
    quickbar:     Array(5).fill(null),
    activeCategory: null,    // null = "Alle"
    currentDict:  null,
    currentAnim:  null,
    ctxTarget:    null,      // Animation für Kontextmenü
};

/* ── DOM-Referenzen ──────────────────────────────────────────── */
const el = {
    overlay:       document.getElementById('overlay'),
    quickbar:      document.getElementById('quickbar'),
    qbSlots:       document.querySelectorAll('.qslot'),
    searchInput:   document.getElementById('search-input'),
    searchClear:   document.getElementById('search-clear'),
    categoryList:  document.getElementById('category-list'),
    animGrid:      document.getElementById('anim-grid'),
    noResults:     document.getElementById('no-results'),
    catTitle:      document.getElementById('category-title'),
    closeBtn:      document.getElementById('close-btn'),
    stopBtn:       document.getElementById('stop-btn'),
    ctxMenu:       document.getElementById('context-menu'),
};

/* ════════════════════════════════════════════════════════════
   NUI-Nachrichten empfangen
   ════════════════════════════════════════════════════════════ */
window.addEventListener('message', ({ data }) => {
    switch (data.action) {

        case 'openMenu':
            state.categories  = data.categories  || [];
            state.quickbar    = data.quickbar     || Array(5).fill(null);
            state.currentDict = data.currentDict  || null;
            state.currentAnim = data.currentAnim  || null;
            if (data.openKey) {
                const k = document.getElementById('footer-open-key');
                if (k) k.textContent = data.openKey;
            }
            openMenu();
            break;

        case 'closeMenu':
            closeMenuLocal();
            break;

        case 'initQuickbar':
            state.quickbar = data.quickbar || Array(5).fill(null);
            if (data.openKey) {
                const k = document.getElementById('footer-open-key');
                if (k) k.textContent = data.openKey;
            }
            renderQuickbar();
            el.quickbar.classList.remove('hidden');
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
   Menü öffnen / schließen
   ════════════════════════════════════════════════════════════ */
function openMenu() {
    state.activeCategory = null;
    el.searchInput.value  = '';
    el.searchClear.style.display = 'none';
    renderCategories();
    renderGrid();
    renderQuickbar();
    el.overlay.classList.remove('hidden');
    setTimeout(() => el.searchInput.focus(), 80);
}

function closeMenuLocal() {
    el.overlay.classList.add('hidden');
    el.searchInput.value = '';
    el.searchClear.style.display = 'none';
    hideCtxMenu();
}

function closeMenuNUI() {
    closeMenuLocal();
    nuiFetch('closeMenu', {});
}

/* ════════════════════════════════════════════════════════════
   Kategorien rendern
   ════════════════════════════════════════════════════════════ */
function renderCategories() {
    el.categoryList.innerHTML = '';

    const totalCount = state.categories.reduce((n, c) => n + (c.anims?.length ?? 0), 0);
    el.categoryList.appendChild(makeCatItem(null, '✨ Alle', totalCount));

    for (const cat of state.categories) {
        el.categoryList.appendChild(makeCatItem(cat.id, cat.label, cat.anims?.length ?? 0));
    }
}

function makeCatItem(id, label, count) {
    const div = document.createElement('div');
    div.className = 'cat-item' + (state.activeCategory === id ? ' active' : '');
    div.dataset.id = id ?? '__all__';
    div.innerHTML = `<span>${label}</span><span class="cat-count">${count}</span>`;
    div.addEventListener('click', () => selectCategory(id));
    return div;
}

function selectCategory(id) {
    state.activeCategory = id;
    el.searchInput.value = '';
    el.searchClear.style.display = 'none';
    renderCategories();
    renderGrid();
}

/* ════════════════════════════════════════════════════════════
   Animations-Grid rendern
   ════════════════════════════════════════════════════════════ */
function renderGrid(term = '') {
    el.animGrid.innerHTML = '';
    const query = term.toLowerCase().trim();

    let list = [];

    if (state.activeCategory === null) {
        // Alle Kategorien
        for (const cat of state.categories) {
            for (const a of (cat.anims ?? [])) {
                list.push({ ...a, catLabel: cat.label });
            }
        }
        el.catTitle.textContent = query ? `Suche: „${term}"` : 'Alle Animationen';
    } else {
        const cat = state.categories.find(c => c.id === state.activeCategory);
        if (cat) {
            list = (cat.anims ?? []).map(a => ({ ...a, catLabel: cat.label }));
            el.catTitle.textContent = cat.label;
        }
    }

    if (query) {
        list = list.filter(a => a.label.toLowerCase().includes(query));
    }

    if (list.length === 0) {
        el.noResults.classList.remove('hidden');
        el.animGrid.style.display = 'none';
        return;
    }

    el.noResults.classList.add('hidden');
    el.animGrid.style.display = '';

    for (const anim of list) {
        el.animGrid.appendChild(makeCard(anim));
    }
}

/* ── Passendes Emoji für eine Animation ──────────────────────── */
function pickEmoji(label = '', catLabel = '') {
    const t = (label + ' ' + catLabel).toLowerCase();
    if (/dance|tanz|club/.test(t))                    return '🕺';
    if (/yoga/.test(t))                               return '🧘';
    if (/push.up|liegestütz/.test(t))                 return '🤸';
    if (/sit.up/.test(t))                             return '🏋️';
    if (/flex/.test(t))                               return '💪';
    if (/jog|jogg/.test(t))                           return '🏃';
    if (/sitz|picnic|boden/.test(t))                  return '🪑';
    if (/lieg|sunbath|sonnen/.test(t))                return '☀️';
    if (/rauch|smok/.test(t))                         return '🚬';
    if (/trink|drink/.test(t))                        return '🍺';
    if (/essen|eat/.test(t))                          return '🍽️';
    if (/telefon|phone|film/.test(t))                 return '📱';
    if (/chill|hang|lean|lehr/.test(t))               return '😎';
    if (/jubel|cheer/.test(t))                        return '🎉';
    if (/klatsch|clap/.test(t))                       return '👏';
    if (/wink/.test(t))                               return '👋';
    if (/zeig|point/.test(t))                         return '👉';
    if (/daumen.hoch|thumb.*up/.test(t))              return '👍';
    if (/daumen.runter|thumb.*down/.test(t))          return '👎';
    if (/kopf|nod/.test(t))                           return '🙂';
    if (/erschreck|shock/.test(t))                    return '😱';
    if (/gelangweilt|bored/.test(t))                  return '😴';
    if (/lach|laugh/.test(t))                         return '😂';
    if (/rock/.test(t))                               return '✊';
    if (/paper|papier/.test(t))                       return '✋';
    if (/schere|scissors/.test(t))                    return '✌️';
    if (/untersuchen|invest/.test(t))                 return '🔍';
    if (/schweiß|weld/.test(t))                       return '🔧';
    if (/klemmbrett|clipboard/.test(t))               return '📋';
    if (/beten|pray/.test(t))                         return '🙏';
    if (/schreib|pc|office/.test(t))                  return '💻';
    return '🎭';
}

function makeCard(anim) {
    const card = document.createElement('div');
    card.className = 'anim-card';
    card.dataset.dict  = anim.dict;
    card.dataset.anim  = anim.anim;
    card.dataset.flag  = anim.flag ?? 1;
    card.dataset.label = anim.label;

    const playing = state.currentDict === anim.dict && state.currentAnim === anim.anim;
    if (playing) card.classList.add('playing');

    card.innerHTML = `
        <div class="card-pulse"></div>
        <div class="card-icon">${pickEmoji(anim.label, anim.catLabel)}</div>
        <div class="card-name">${anim.label}</div>
        <div class="card-cat">${anim.catLabel ?? ''}</div>
    `;

    card.addEventListener('click',       () => onCardClick(anim));
    card.addEventListener('contextmenu', (e) => onCardRightClick(e, anim));
    return card;
}

/* ════════════════════════════════════════════════════════════
   Animation abspielen / stoppen
   ════════════════════════════════════════════════════════════ */
function onCardClick(anim) {
    const isPlaying = state.currentDict === anim.dict && state.currentAnim === anim.anim;
    if (isPlaying) {
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

/** Alle Karten- und Quickbar-Highlights aktualisieren */
function syncPlayingUI() {
    document.querySelectorAll('.anim-card').forEach(c => {
        c.classList.toggle('playing', c.dataset.dict === state.currentDict && c.dataset.anim === state.currentAnim);
    });
    syncQuickbarActive();
}

/* ════════════════════════════════════════════════════════════
   Schnellzugriff-Leiste
   ════════════════════════════════════════════════════════════ */
function renderQuickbar() {
    el.qbSlots.forEach((slot, i) => {
        const data = state.quickbar[i];
        slot.querySelector('.qslot-icon').textContent = data?.dict ? pickEmoji(data.label) : '➕';
        slot.querySelector('.qslot-name').textContent = data?.label ?? 'Leer';
    });
    syncQuickbarActive();
}

function syncQuickbarActive() {
    el.qbSlots.forEach((slot, i) => {
        const d = state.quickbar[i];
        const on = d?.dict && d.dict === state.currentDict && d.anim === state.currentAnim;
        slot.classList.toggle('active', !!on);
    });
}

/* ════════════════════════════════════════════════════════════
   Kontextmenü (Rechtsklick auf Karte)
   ════════════════════════════════════════════════════════════ */
function onCardRightClick(e, anim) {
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
        <div class="ctx-label">Schnellzugriff</div>
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
    renderQuickbar();
    el.quickbar.classList.remove('hidden');

    nuiFetch('setQuickbar', { slot: index + 1, label: anim.label, dict: anim.dict, anim: anim.anim, flag: anim.flag ?? 1 });
    hideCtxMenu();
}

/* ════════════════════════════════════════════════════════════
   Event-Listener
   ════════════════════════════════════════════════════════════ */
el.closeBtn.addEventListener('click', closeMenuNUI);
el.stopBtn.addEventListener('click', doStopAnim);

el.searchInput.addEventListener('input', e => {
    const v = e.target.value;
    el.searchClear.style.display = v ? 'block' : 'none';
    // Beim Suchen automatisch auf "Alle Kategorien" umschalten
    if (v && state.activeCategory !== null) {
        state.activeCategory = null;
        renderCategories();
    }
    renderGrid(v);
});

el.searchClear.addEventListener('click', () => {
    el.searchInput.value = '';
    el.searchClear.style.display = 'none';
    renderGrid();
    el.searchInput.focus();
});

document.addEventListener('keydown', e => {
    if (e.key === 'Escape') {
        if (wheelOpen) closeWheelNUI();
        else closeMenuNUI();
    }
});

document.addEventListener('click', e => {
    if (el.ctxMenu.style.display === 'block' && !el.ctxMenu.contains(e.target)) {
        hideCtxMenu();
    }
});

/* Rechtsklick außerhalb von Karten verhindern (kein Browser-Kontextmenü) */
document.addEventListener('contextmenu', e => {
    if (!e.target.closest('.anim-card')) e.preventDefault();
});

/* ════════════════════════════════════════════════════════════
   NUI-Fetch-Wrapper
   ════════════════════════════════════════════════════════════ */
function nuiFetch(endpoint, data) {
    fetch(`https://${getResourceName()}/${endpoint}`, {
        method:  'POST',
        headers: { 'Content-Type': 'application/json' },
        body:    JSON.stringify(data ?? {}),
    }).catch(() => { /* NUI nicht verfügbar (z. B. Browser-Vorschau) */ });
}

/* ════════════════════════════════════════════════════════════
   ANIMATIONS-RAD (Wheel)
   SVG-basiertes Rad mit 12 Kategorien – GTA-Waffenrad-Stil.
   Halten = offen, Loslassen = geschlossen. Klick = Animation.
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

/* Colour palette – alternating purple/cyan tones per segment */
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

/* ── Build SVG Wheel ─────────────────────────────────────── */
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

        /* Labels */
        const LR = (R_OUT + R_IN) / 2;
        const lx = +px(LR, midA), ly = +py(LR, midA);
        const si    = cat.label.search(/\s/);
        const icon  = si > -1 ? cat.label.slice(0, si) : '🎭';
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

/* ── Segment hover ───────────────────────────────────────── */
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

/* ── Animation list panel ────────────────────────────────── */
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

/* ── Wheel Quickbar strip ────────────────────────────────── */
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
