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
            openMenu();
            break;

        case 'closeMenu':
            closeMenuLocal();
            break;

        case 'initQuickbar':
            state.quickbar = data.quickbar || Array(5).fill(null);
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
    renderGrid(v);
});

el.searchClear.addEventListener('click', () => {
    el.searchInput.value = '';
    el.searchClear.style.display = 'none';
    renderGrid();
    el.searchInput.focus();
});

document.addEventListener('keydown', e => {
    if (e.key === 'Escape') closeMenuNUI();
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
