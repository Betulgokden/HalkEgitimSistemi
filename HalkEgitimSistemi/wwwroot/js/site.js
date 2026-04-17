// ============================================
// HALK EĞİTİM SİSTEMİ - PREMIUM INTERACTIONS
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

    // ---- Scroll Reveal Animation (IntersectionObserver) ----
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
            if (entry.isIntersecting) {
                entry.target.classList.add('revealed');
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    document.querySelectorAll('.reveal-on-scroll').forEach(function (el) {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease-out, transform 0.6s ease-out';
        observer.observe(el);
    });

    // Stagger animations for card grids
    document.querySelectorAll('.stagger-children').forEach(function (container) {
        var children = container.children;
        Array.from(children).forEach(function (child, index) {
            child.style.opacity = '0';
            child.style.transform = 'translateY(30px)';
            child.style.transition = 'opacity 0.5s ease-out ' + (index * 0.1) + 's, transform 0.5s ease-out ' + (index * 0.1) + 's';

            var childObserver = new IntersectionObserver(function (entries) {
                entries.forEach(function (entry) {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = '1';
                        entry.target.style.transform = 'translateY(0)';
                        childObserver.unobserve(entry.target);
                    }
                });
            }, observerOptions);

            childObserver.observe(child);
        });
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

    // ---- Tilt Effect on Cards ----
    document.querySelectorAll('.tilt-card').forEach(function (card) {
        card.addEventListener('mousemove', function (e) {
            var rect = card.getBoundingClientRect();
            var x = e.clientX - rect.left;
            var y = e.clientY - rect.top;
            var centerX = rect.width / 2;
            var centerY = rect.height / 2;
            var rotateX = (y - centerY) / 20;
            var rotateY = (centerX - x) / 20;
            card.style.transform = 'perspective(1000px) rotateX(' + rotateX + 'deg) rotateY(' + rotateY + 'deg) translateZ(10px)';
        });
        card.addEventListener('mouseleave', function () {
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
            placeholder.style.cssText = 'width:100%;height:' + (this.height || 200) + 'px;display:flex;align-items:center;justify-content:center;background:rgba(99,102,241,0.1);border-radius:12px;color:#6366f1;font-size:2rem;';
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
    // ---- Theme Toggle Logic ----
    const themeBtn = document.getElementById('themeToggleBtn');
    const themeIcon = document.getElementById('themeIcon');
    
    if (themeBtn && themeIcon) {
        if (document.documentElement.getAttribute('data-theme') === 'light') {
            themeIcon.classList.replace('bi-moon-stars-fill', 'bi-sun-fill');
            themeIcon.style.color = '#f59e0b';
        }
        
        themeBtn.addEventListener('click', function () {
            const currentTheme = document.documentElement.getAttribute('data-theme') || 'dark';
            const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
            
            document.documentElement.setAttribute('data-theme', newTheme);
            localStorage.setItem('theme', newTheme);
            
            themeIcon.style.transform = 'scale(0) rotate(180deg)';
            
            setTimeout(function () {
                if (newTheme === 'light') {
                    themeIcon.classList.replace('bi-moon-stars-fill', 'bi-sun-fill');
                    themeIcon.style.color = '#f59e0b';
                } else {
                    themeIcon.classList.replace('bi-sun-fill', 'bi-moon-stars-fill');
                    themeIcon.style.color = 'var(--text-secondary)';
                }
                themeIcon.style.transform = 'scale(1) rotate(0deg)';
                themeIcon.style.transition = 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)';
            }, 300);
        });
    }

    /* --- Global Raining Icons Efekti --- */
    const rainContainer = document.getElementById('rainContainer');
    if (rainContainer) {
        // Kullanıcının isteğine göre Spor(Dribbble, Bicycle vs.), Müzik(Gitar/Nota) ve Aşçılık(Cup, Egg) ikonları eklendi.
        const icons = [
            'bi-laptop', 'bi-palette', 'bi-pencil', 'bi-scissors', 'bi-easel', 
            'bi-music-note-beamed', 'bi-camera', 'bi-brush', 'bi-calculator', 
            'bi-book', 'bi-code-slash', 
            'bi-music-note-list', 'bi-vinyl', /* Müzik/Gitar vb. */
            'bi-cup-hot-fill', 'bi-egg-fried', /* Aşçı/Mutfak */
            'bi-bicycle', 'bi-activity', 'bi-dribbble', 'bi-trophy' /* Spor */
        ];
        
        const rainCount = 40; // Çok güzel görünmesi için sayısı artırıldı
        for (let i = 0; i < rainCount; i++) {
            let iconElem = document.createElement('i');
            let randomIcon = icons[Math.floor(Math.random() * icons.length)];
            iconElem.className = `bi ${randomIcon} rain-icon`;
            
            let left = Math.random() * 100; 
            let size = Math.random() * 1.5 + 1.2; // Biraz daha etli (1.2rem - 2.7rem)
            let duration = Math.random() * 20 + 10; // 10s - 30s arası süzülsün
            let delay = Math.random() * 20; 
            
            iconElem.style.left = `${left}%`;
            iconElem.style.fontSize = `${size}rem`;
            iconElem.style.animationDuration = `${duration}s`;
            iconElem.style.animationDelay = `-${delay}s`; 
            
            rainContainer.appendChild(iconElem);
        }
    }

    console.log('%c🎓 Halk Eğitim Sistemi', 'color: #6366f1; font-size: 20px; font-weight: bold;');
    console.log('%cPremium Edition v2.0', 'color: #ec4899; font-size: 12px;');
});
