// ============================================
// HALK EÄİTİM SİSTEMİ - PREMIUM INTERACTIONS
// ============================================

document.addEventListener('DOMContentLoaded', function () {

    // ---- Navbar Scroll Effect ----
    const navbar = document.querySelector('.navbar-premium');
    if (navbar) {
        window.addEventListener('scroll', function () {
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });
    }

    // Animasyonlar hız için devre dışı bırakıldı (Anında açılış)
    document.querySelectorAll('.reveal-on-scroll, .stagger-children > *').forEach(function (el) {
        el.style.opacity = '1';
        el.style.transform = 'none';
    });

    // ---- Counter Animation ----
    document.querySelectorAll('.counter-animated').forEach(function (counter) {
        var target = parseInt(counter.getAttribute('data-target'));
        if (isNaN(target)) return;

        var counterObserver = new IntersectionObserver(function (entries) {
            entries.forEach(function (entry) {
                if (entry.isIntersecting) {
                    animateCounter(counter, target);
                    counterObserver.unobserve(counter);
                }
            });
        }, { threshold: 0.5 });

        counterObserver.observe(counter);
    });

    function animateCounter(element, target) {
        var current = 0;
        var increment = target / 60;
        var duration = 2000;
        var stepTime = duration / 60;

        function step() {
            current += increment;
            if (current >= target) {
                element.textContent = target + '+';
                return;
            }
            element.textContent = Math.floor(current) + '+';
            requestAnimationFrame(step);
        }

        requestAnimationFrame(step);
    }

    // ---- Smooth Scroll for anchor links ----
    document.querySelectorAll('a[href^="#"]').forEach(function (anchor) {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            var targetEl = document.querySelector(this.getAttribute('href'));
            if (targetEl) {
                targetEl.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });

    // ---- Ripple Effect on Buttons ----
    document.querySelectorAll('.btn-premium, .btn-primary-glow, .btn-success-glow, .btn-danger-glow, .btn-warning-glow').forEach(function (btn) {
        btn.addEventListener('click', function (e) {
            var ripple = document.createElement('span');
            ripple.style.cssText = 'position:absolute;border-radius:50%;background:rgba(255,255,255,0.3);transform:scale(0);animation:ripple-anim 0.6s linear;pointer-events:none;';
            var rect = this.getBoundingClientRect();
            var size = Math.max(rect.width, rect.height);
            ripple.style.width = ripple.style.height = size + 'px';
            ripple.style.left = (e.clientX - rect.left - size / 2) + 'px';
            ripple.style.top = (e.clientY - rect.top - size / 2) + 'px';
            this.style.position = 'relative';
            this.style.overflow = 'hidden';
            this.appendChild(ripple);
            setTimeout(function () { ripple.remove(); }, 600);
        });
    });

    // Add ripple keyframes
    if (!document.querySelector('#ripple-style')) {
        var style = document.createElement('style');
        style.id = 'ripple-style';
        style.textContent = '@keyframes ripple-anim { to { transform: scale(4); opacity: 0; } }';
        document.head.appendChild(style);
    }

    // ---- Tilt Effect on Cards (Throttled for performance) ----
    let tiltRAF;
    document.querySelectorAll('.tilt-card').forEach(function (card) {
        card.addEventListener('mousemove', function (e) {
            if (tiltRAF) cancelAnimationFrame(tiltRAF);
            tiltRAF = requestAnimationFrame(() => {
                var rect = card.getBoundingClientRect();
                var x = e.clientX - rect.left;
                var y = e.clientY - rect.top;
                var centerX = rect.width / 2;
                var centerY = rect.height / 2;
                var rotateX = (y - centerY) / 25;
                var rotateY = (centerX - x) / 25;
                card.style.transform = 'perspective(1000px) rotateX(' + rotateX + 'deg) rotateY(' + rotateY + 'deg) translateZ(10px)';
            });
        });
        card.addEventListener('mouseleave', function () {
            if (tiltRAF) cancelAnimationFrame(tiltRAF);
            card.style.transform = 'perspective(1000px) rotateX(0) rotateY(0) translateZ(0)';
            card.style.transition = 'transform 0.5s ease';
        });
        card.addEventListener('mouseenter', function () {
            card.style.transition = 'transform 0.1s ease';
        });
    });

    // ---- Typing Effect ----
    document.querySelectorAll('.typing-effect').forEach(function (el) {
        var text = el.getAttribute('data-text') || el.textContent;
        el.textContent = '';
        el.style.borderRight = '2px solid var(--primary-light)';
        var i = 0;
        function type() {
            if (i < text.length) {
                el.textContent += text.charAt(i);
                i++;
                setTimeout(type, 50);
            } else {
                el.style.borderRight = 'none';
            }
        }
        var typingObserver = new IntersectionObserver(function (entries) {
            if (entries[0].isIntersecting) {
                type();
                typingObserver.unobserve(el);
            }
        }, { threshold: 0.5 });
        typingObserver.observe(el);
    });

    // ---- Image Lazy Load Error Fallback ----
    document.querySelectorAll('img').forEach(function (img) {
        img.addEventListener('error', function () {
            this.style.display = 'none';
            var placeholder = document.createElement('div');
            placeholder.style.cssText = 'width:100%;height:' + (this.height || 200) + 'px;display:flex;align-items:center;justify-content:center;background:rgba(99,102,241,0.1);border-radius:12px;color:#581C1C;font-size:2rem;';
            placeholder.innerHTML = '<i class="bi bi-image"></i>';
            this.parentNode.insertBefore(placeholder, this.nextSibling);
        });
    });

    // ---- Form Focus Animation ----
    document.querySelectorAll('.form-premium-control, .form-control, .form-select').forEach(function (input) {
        input.addEventListener('focus', function () {
            var parent = this.closest('.form-premium-group') || this.parentElement;
            if (parent) {
                parent.style.transform = 'translateY(-2px)';
                parent.style.transition = 'transform 0.3s ease';
            }
        });
        input.addEventListener('blur', function () {
            var parent = this.closest('.form-premium-group') || this.parentElement;
            if (parent) {
                parent.style.transform = 'translateY(0)';
            }
        });
    });

    // ---- Active Nav Link ----
    var currentPath = window.location.pathname.toLowerCase();
    document.querySelectorAll('.nav-link-premium').forEach(function (link) {
        var href = link.getAttribute('href');
        if (href) {
            href = href.toLowerCase();
            if (currentPath === href || (href !== '/' && currentPath.startsWith(href))) {
                link.classList.add('active-link');
            }
        }
    });
    // Theme Toggle logic removed from JS - handled in Layout for reliability
    
    // Rain logic removed from JS - handled in Layout for consistency
    
    // ---- FOMO (Social Proof) Toasts ----
    const fomoData = [
        { icon: 'bi-fire', text: 'Mehmet, Ağ Teknolojileri sınıfındaki son kontenjanı kaptı!', color: '#C5A059' },
        { icon: 'bi-eye', text: 'Şu an sizinle birlikte 8 kişi bu kursu inceliyor.', color: '#C5A059' },
        { icon: 'bi-star-fill', text: 'Bu hafta Sanal Sergiden 3 eser satıldı. Siz de üretmeye başlayın!', color: '#C5A059' },
        { icon: 'bi-person-badge', text: 'Ayşe, "Yetenek Ağacı"nda Uzman seviyesine yükseldi!', color: '#C5A059' },
        { icon: 'bi-award', text: 'Bugün 24 kişi yeni sertifikalarını LinkedIn'de paylaştı.', color: '#C5A059' }
    ];

    function showFomoToast() {
        if (window.location.pathname.includes('/Account/Login')) return; // Giriş sayfasında gösterme
        
        const item = fomoData[Math.floor(Math.random() * fomoData.length)];
        const toast = document.createElement('div');
        toast.className = 'fomo-toast';
        toast.style.cssText = `
            position: fixed; bottom: 30px; left: 30px; z-index: 9999;
            background: rgba(15, 15, 35, 0.95); backdrop-filter: blur(20px);
            border: 1px solid ${item.color}44; border-left: 5px solid ${item.color};
            padding: 15px 25px; border-radius: 12px; color: white;
            box-shadow: 0 10px 40px rgba(0,0,0,0.5); display: flex;
            align-items: center; gap: 15px; font-size: 0.88rem; font-weight: 500;
            max-width: 350px; transition: all 0.5s ease; opacity: 0; transform: translateY(20px);
        `;
        toast.innerHTML = `<i class="bi ${item.icon}" style="color: ${item.color}; font-size: 1.2rem;"></i> <span>${item.text}</span>`;
        document.body.appendChild(toast);

        // Fade in
        setTimeout(() => { toast.style.opacity = '1'; toast.style.transform = 'translateY(0)'; }, 100);

        // Fade out and remove
        setTimeout(() => {
            toast.style.opacity = '0';
            toast.style.transform = 'translateY(20px)';
            setTimeout(() => toast.remove(), 500);
        }, 6000);
    }

    // İlk toast 8 sn sonra, sonra her 20-40 sn'de bir
    setTimeout(() => {
        showFomoToast();
        setInterval(showFomoToast, Math.random() * 20000 + 20000);
    }, 8000);

    // ---- Dynamic Active Counter ----
    const liveActiveCount = document.getElementById('liveActiveCount');
    if (liveActiveCount) {
        let count = 144;
        setInterval(() => {
            const change = Math.floor(Math.random() * 3) - 1; // -1, 0, or 1
            count += change;
            if (count < 138) count = 138;
            if (count > 152) count = 152;
            liveActiveCount.textContent = count;
        }, 4000);
    }

    console.log('%cğŸ“ Public Education System', 'color: #C5A059; font-size: 20px; font-weight: bold;');
    console.log('%cPremium Edition v2.0', 'color: #581C1C; font-size: 12px;');
});


