/* AbrxOS web: navegación accesible + panel de desarrollo desde status.json */
(function initNav() {
    const toggle = document.getElementById('menu-toggle');
    const nav = document.getElementById('site-nav');
    if (toggle && nav) {
        toggle.addEventListener('click', () => {
            const open = nav.classList.toggle('open');
            toggle.setAttribute('aria-expanded', String(open));
            toggle.setAttribute('aria-label', open ? 'Cerrar menú' : 'Abrir menú');
        });
    }
    document.querySelectorAll('.has-submenu > .nav-top').forEach((btn) => {
        btn.addEventListener('click', () => {
            const li = btn.parentElement;
            const isOpen = li.classList.contains('open');
            document.querySelectorAll('.has-submenu.open').forEach((other) => {
                other.classList.remove('open');
                const b = other.querySelector('.nav-top');
                if (b) b.setAttribute('aria-expanded', 'false');
            });
            if (!isOpen) {
                li.classList.add('open');
                btn.setAttribute('aria-expanded', 'true');
            } else {
                btn.setAttribute('aria-expanded', 'false');
            }
        });
        btn.addEventListener('keydown', (ev) => {
            if (ev.key === 'ArrowDown') {
                ev.preventDefault();
                const li = btn.parentElement;
                if (!li.classList.contains('open')) btn.click();
                const first = li.querySelector('.submenu a');
                if (first) first.focus();
            }
        });
    });
    document.addEventListener('keydown', (ev) => {
        if (ev.key === 'Escape') {
            document.querySelectorAll('.has-submenu.open').forEach((li) => {
                li.classList.remove('open');
                const b = li.querySelector('.nav-top');
                if (b) b.setAttribute('aria-expanded', 'false');
            });
            if (nav && nav.classList.contains('open')) {
                nav.classList.remove('open');
                if (toggle) toggle.setAttribute('aria-expanded', 'false');
            }
        }
    });
    document.addEventListener('click', (ev) => {
        if (!ev.target.closest('.has-submenu')) {
            document.querySelectorAll('.has-submenu.open').forEach((li) => {
                li.classList.remove('open');
                const b = li.querySelector('.nav-top');
                if (b) b.setAttribute('aria-expanded', 'false');
            });
        }
    });
})();

let lastValidData = null;
let lastRenderedJsonString = "";

function formatTime(date) {
    return date.toTimeString().split(' ')[0];
}

function updateConnectionStatus(status, text) {
    const badge = document.getElementById('connection-status');
    if (!badge) return;
    badge.className = `badge ${status}`;
    badge.textContent = text;
}

function showErrorBanner(show) {
    const banner = document.getElementById('error-banner');
    if (!banner) return;
    if (show) banner.classList.remove('hidden');
    else banner.classList.add('hidden');
}

function renderData(data) {
    const jsonString = JSON.stringify(data);
    const hasChanged = jsonString !== lastRenderedJsonString;
    const now = new Date();
    const lastQuery = document.getElementById('last-query');
    if (lastQuery) lastQuery.textContent = `Última consulta: ${formatTime(now)}`;
    if (data.lastUpdate) {
        const updateDate = new Date(data.lastUpdate);
        const el = document.getElementById('last-state-update');
        if (el) {
            if (!isNaN(updateDate)) el.textContent = `Última actualización de estado: ${formatTime(updateDate)}`;
            else el.textContent = `Última actualización de estado: ${data.lastUpdate}`;
        }
    }
    if (!hasChanged && lastValidData !== null) return;
    lastRenderedJsonString = jsonString;
    lastValidData = data;

    safeSetText('current-phase', data.phase);
    safeSetText('phase-objective', data.phaseObjective);
    if (data.activeTask) {
        safeSetText('active-task-id', data.activeTask.id);
        safeSetText('active-task-title', data.activeTask.title);
        safeSetText('active-task-status', data.activeTask.status);
    }
    renderList('work-in-progress-list', data.workInProgress, (item) => {
        const li = document.createElement('li');
        li.textContent = item;
        return li;
    });
    if (data.checks) {
        renderList('auto-checks-list', data.checks.automatic, (check) => {
            const li = document.createElement('li');
            const spanDesc = document.createElement('span');
            spanDesc.className = 'check-desc';
            spanDesc.textContent = check.description;
            const spanRes = document.createElement('span');
            spanRes.className = 'check-result';
            spanRes.textContent = `Resultado: ${check.result}`;
            li.appendChild(spanDesc);
            li.appendChild(spanRes);
            return li;
        });
        renderList('manual-checks-list', data.checks.manual, (check) => {
            const li = document.createElement('li');
            const spanDesc = document.createElement('span');
            spanDesc.className = 'check-desc';
            spanDesc.textContent = check.description;
            const spanRes = document.createElement('span');
            spanRes.className = 'check-result';
            spanRes.textContent = `Estado: ${check.result}`;
            li.appendChild(spanDesc);
            li.appendChild(spanRes);
            return li;
        });
    }
    renderList('next-steps-list', data.nextSteps, (step) => {
        const li = document.createElement('li');
        li.textContent = step;
        return li;
    });
    const blockersContainer = document.getElementById('blockers-container');
    if (blockersContainer) {
        blockersContainer.textContent = '';
        if (!data.blockers || data.blockers.length === 0) {
            const p = document.createElement('p');
            p.className = 'none-text';
            p.textContent = 'Sin bloqueos registrados.';
            blockersContainer.appendChild(p);
        } else {
            const ul = document.createElement('ul');
            ul.className = 'bullet-list';
            data.blockers.forEach((blocker) => {
                const li = document.createElement('li');
                li.textContent = blocker;
                ul.appendChild(li);
            });
            blockersContainer.appendChild(ul);
        }
    }
    const roadmapTbody = document.getElementById('roadmap-tbody');
    if (roadmapTbody) {
        roadmapTbody.textContent = '';
        if (data.roadmapMilestones) {
            data.roadmapMilestones.forEach((milestone) => {
                const tr = document.createElement('tr');
                const tdPhase = document.createElement('td');
                tdPhase.textContent = milestone.phase;
                const tdTitle = document.createElement('td');
                tdTitle.textContent = milestone.title;
                const tdStatus = document.createElement('td');
                tdStatus.textContent = milestone.status;
                tr.appendChild(tdPhase);
                tr.appendChild(tdTitle);
                tr.appendChild(tdStatus);
                roadmapTbody.appendChild(tr);
            });
        }
    }
    const timeline = document.getElementById('history-timeline');
    if (timeline) {
        timeline.textContent = '';
        if (data.history) {
            data.history.forEach((item) => {
                const div = document.createElement('div');
                div.className = 'timeline-item';
                const dateDiv = document.createElement('div');
                dateDiv.className = 'timeline-date';
                dateDiv.textContent = item.date;
                const eventDiv = document.createElement('div');
                eventDiv.className = 'timeline-event';
                eventDiv.textContent = item.event;
                const evidenceDiv = document.createElement('div');
                evidenceDiv.className = 'timeline-evidence';
                evidenceDiv.textContent = `Evidencia: ${item.evidence}`;
                div.appendChild(dateDiv);
                div.appendChild(eventDiv);
                div.appendChild(evidenceDiv);
                timeline.appendChild(div);
            });
        }
    }
}

function safeSetText(elementId, text) {
    const el = document.getElementById(elementId);
    if (el) el.textContent = text;
}

function renderList(elementId, items, createItemFn) {
    const el = document.getElementById(elementId);
    if (!el) return;
    el.textContent = '';
    if (!items || items.length === 0) {
        const li = document.createElement('li');
        li.textContent = 'Ninguno';
        el.appendChild(li);
        return;
    }
    items.forEach((item) => el.appendChild(createItemFn(item)));
}

async function fetchStatus() {
    try {
        const response = await fetch('status.json?' + new Date().getTime());
        if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
        const data = await response.json();
        updateConnectionStatus('connected', 'Conectado');
        showErrorBanner(false);
        renderData(data);
    } catch (error) {
        console.error('Error fetching status.json:', error);
        updateConnectionStatus('error', 'Error de conexión');
        showErrorBanner(true);
    }
}

fetchStatus();
setInterval(fetchStatus, 15000);
