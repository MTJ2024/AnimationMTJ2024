(function () {
    var menuEl = document.getElementById('animation-menu');
    var entriesEl = document.getElementById('menu-entries');
    var btnPlay = document.getElementById('btn-play');
    var btnStop = document.getElementById('btn-stop');
    var btnClose = document.getElementById('btn-close');

    var entries = [];
    var currentIndex = 0;
    var menuVisible = false;
    var resourceName = 'AnimationMTJ2024';

    function escapeHtml(text) {
        var div = document.createElement('div');
        div.appendChild(document.createTextNode(text));
        return div.innerHTML;
    }

    function scrollToActive() {
        var active = entriesEl.querySelector('.active');
        if (active) {
            active.scrollIntoView({ block: 'nearest', behavior: 'smooth' });
        }
    }

    function renderEntries() {
        entriesEl.innerHTML = '';
        for (var i = 0; i < entries.length; i++) {
            var entry = entries[i];
            var el = document.createElement('div');
            el.className = 'menu-entry' + (i === currentIndex ? ' active' : '');
            el.setAttribute('data-index', i);

            var iconSpan = document.createElement('span');
            iconSpan.className = 'entry-icon';
            iconSpan.textContent = (i === currentIndex) ? '\u25B8' : '\u3000';

            var labelSpan = document.createElement('span');
            labelSpan.className = 'entry-label';
            labelSpan.textContent = entry.label || 'Unbenannt';

            var typeSpan = document.createElement('span');
            typeSpan.className = 'entry-type';
            typeSpan.textContent = entry.type || '';

            el.appendChild(iconSpan);
            el.appendChild(labelSpan);
            el.appendChild(typeSpan);

            el.addEventListener('click', onEntryClick);
            el.addEventListener('dblclick', onEntryDblClick);
            entriesEl.appendChild(el);
        }
        scrollToActive();
    }

    function onEntryClick(e) {
        var target = e.currentTarget;
        var index = parseInt(target.getAttribute('data-index'), 10);
        if (!isNaN(index) && index >= 0 && index < entries.length) {
            currentIndex = index;
            renderEntries();
        }
    }

    function onEntryDblClick(e) {
        var target = e.currentTarget;
        var index = parseInt(target.getAttribute('data-index'), 10);
        if (!isNaN(index) && index >= 0 && index < entries.length) {
            currentIndex = index;
            renderEntries();
            playSelected();
        }
    }

    function showMenu(data) {
        entries = data.entries || [];
        currentIndex = (data.currentIndex || 1) - 1;
        if (currentIndex < 0 || currentIndex >= entries.length) {
            currentIndex = 0;
        }
        if (data.resourceName) {
            resourceName = data.resourceName;
        }
        renderEntries();
        menuEl.style.display = 'flex';
        menuVisible = true;
    }

    function hideMenu() {
        menuEl.style.display = 'none';
        menuVisible = false;
    }

    function sendCallback(name, data) {
        fetch('https://' + resourceName + '/' + name, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data || {})
        }).catch(function () {});
    }

    function playSelected() {
        if (entries.length > 0) {
            sendCallback('playEntry', { index: currentIndex + 1 });
        }
    }

    function stopAction() {
        sendCallback('stopAction', {});
    }

    function closeMenu() {
        sendCallback('closeMenu', {});
    }

    btnPlay.addEventListener('click', function () {
        playSelected();
    });

    btnStop.addEventListener('click', function () {
        stopAction();
    });

    btnClose.addEventListener('click', function () {
        closeMenu();
    });

    document.addEventListener('keydown', function (e) {
        if (!menuVisible) {
            return;
        }

        switch (e.key) {
            case 'ArrowUp':
                e.preventDefault();
                if (entries.length > 0) {
                    currentIndex = currentIndex - 1;
                    if (currentIndex < 0) {
                        currentIndex = entries.length - 1;
                    }
                    renderEntries();
                }
                break;
            case 'ArrowDown':
                e.preventDefault();
                if (entries.length > 0) {
                    currentIndex = currentIndex + 1;
                    if (currentIndex >= entries.length) {
                        currentIndex = 0;
                    }
                    renderEntries();
                }
                break;
            case 'Enter':
                e.preventDefault();
                playSelected();
                break;
            case 'x':
            case 'X':
                e.preventDefault();
                stopAction();
                break;
            case 'Escape':
            case 'Backspace':
                e.preventDefault();
                closeMenu();
                break;
        }
    });

    window.addEventListener('message', function (event) {
        var data = event.data;
        if (!data || !data.action) {
            return;
        }

        switch (data.action) {
            case 'open':
                showMenu(data);
                break;
            case 'close':
                hideMenu();
                break;
        }
    });
})();
