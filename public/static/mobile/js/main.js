/*------------------------------------------------------------------
Theme Name: Shuttle
Theme URL: http://codnauts.com
Author: Codnauts
Author URI: http://themeforest.net/user/codnauts
Version: 1.0
License: Regular or Extended from ThemeForest only
Plugin Licenses: GPL or MIT
Last change: first release
Primary use: App & Mobile Website  
-------------------------------------------------------------------*/

// Adding strict mode
"use strict";

// This script prevents links from opening in Mobile Safari. https://gist.github.com/1042026
(function(a, b, c) {
	if (c in b && b[c]) {
		var d, e = a.location,
			f = /^(a|html)$/i;
		a.addEventListener("click", function(a) {
			d = a.target;
			while (!f.test(d.nodeName)) d = d.parentNode;
			"href" in d && (d.href.indexOf("http") || ~d.href.indexOf(e.host)) && (a.preventDefault(), e.href = d.href)
		}, !1)
	}
})(document, window.navigator, "standalone")

// SmoothState
var duration_CONSTANT = 250;
var options = {
    prefetch: true,
    cacheLength: 0,
    blacklist: '.no-smoothState',
    onStart: {
        duration: duration_CONSTANT,
        render: function ($container) {
            $('#bottom-sheet').closeModal();
            $container.addClass('is-exiting');
            smoothState.restartCSSAnimations();
            setTimeout(function () { }, duration_CONSTANT * 2);
        }
    },
    onReady: {
        duration: 0,
        render: function ($container, $newContent) {
            $container.removeClass('is-exiting');
            $container.html($newContent);
        }
    },
    onAfter: function ($container, $newContent) {
        setTimeout(function () {
            ResizeHandler = ResizeHandler || function () { };
            ResizeHandler();
        }, 500)
        initiate_plugins(); // All onAfter calls goes inside this function
    }
};
var smoothState = $('#main').smoothState(options).data('smoothState');

/*------------------------------------------------------------------
    Call all function for Ajax
-------------------------------------------------------------------*/
function initiate_plugins() {

    // Body class fix
    $('body').removeClass('menu-open');
   
    // Tabs
    $('ul.tabs').tabs();

    // Modal
    $('.modal-trigger').leanModal();

    // Accordion
    $('.collapsible').collapsible({
        accordion: true
    });

    // Drag
    $('.drag-target').remove();

    // Right Sidebar
    $('#open-right').sideNav({ // Trigger id
        menuWidth: 280, // Default is 240
        edge: 'right', // Choose the horizontal origin
        closeOnClick: false // Closes side-nav on <a> clicks, useful for Angular/Meteor
    });

    // Left Sidebar
    $('#open-left').sideNav({ // Trigger id
        menuWidth: 280, // Default is 240
        edge: 'left', // Choose the horizontal origin
        closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
    });
  
    // Swipebox
    $('.swipebox').swipebox();

    // Masonry
    $('.grid').masonry({
        itemSelector: '.grid-item'
    });

    // Material Layout
    $('.parallax').parallax();
    $(function () {
        var hBanner = $('.hero-material').height();
        var cbHeight = hBanner - 86;
        var hHeight = hBanner - 86; // for Title
        $(window).scroll(function () {
            var scroll = $(window).scrollTop();
            if (scroll >= cbHeight) {
                $(".nav-material").addClass('nav-bg');
            }
            if (scroll <= cbHeight) {
                $(".nav-material").removeClass('nav-bg');
            }
            // For heading Title
            if (scroll >= hHeight) {
                $(".banner-title").hide();
                $(".nav-material .title").show();
            }
            if (scroll <= hHeight) {
                $(".banner-title").show();
                $(".nav-material .title").hide();
            }
        });
    });

    // Add Primary Color To Header After Scroll Down
    $(function() {
        //caches a jQuery object containing the header element
        var header = $("#toolbar.trnasparent");
        $(window).scroll(function() {
            var scroll = $(window).scrollTop();

            if (scroll >= 350) {
                header.removeClass('transparent').addClass("primary-color");
            } else {
                header.removeClass("primary-color").addClass('transparent');
            }
        });
    });

    // Sliders
    var swiper = new Swiper('.swiper-slider', { // Default
        pagination: '.swiper-pagination',
        paginationClickable: true,
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        autoplay: false,
        loop: true,
        paginationType: 'progress',
    });

    var swiper = new Swiper('.testimonials', { // Testimonial
        pagination: '.swiper-pagination',
        slidesPerView: 1,
        centeredSlides: true,
        paginationClickable: true,
        spaceBetween: 20,
        loop: true,
    });

    var swiper = new Swiper('.slider-sliced', { // Sliced
        pagination: '.swiper-pagination',
        slidesPerView: 1,
        centeredSlides: true,
        paginationClickable: true,
        spaceBetween: 0,
    });

    var swiper = new Swiper('.swiper-slider-full', { // Sliced
        pagination: '.swiper-pagination',
        slidesPerView: 1,
        centeredSlides: true,
        paginationClickable: true,
        spaceBetween: 0,
    });

    var swiper = new Swiper('.slider-drawer', { // Drawer
        pagination: '.swiper-pagination',
        slidesPerView: 1,
        centeredSlides: true,
        paginationClickable: true,
        spaceBetween: 0,
    });

    var swiper = new Swiper('.steps', { // Walkthrough
        pagination: '.swiper-pagination',
        slidesPerView: 1,
        centeredSlides: true,
        paginationClickable: true,
        spaceBetween: 0,
    });

    // MixItUP
    $(function () {
        var layout = 'grid', // Store the current layout as a variable
            $container = $('#filter'), // Cache the MixItUp container
            $changeLayout = $('#ChangeLayout'); // Cache the changeLayout button
        // Instantiate MixItUp with some custom options:
        try {
            $container.mixItUp('destroy');
        } catch (x) { }
        $container.mixItUp({
            animation: {
                animateChangeLayout: true, // Animate the positions of targets as the layout changes
                animateResizeTargets: true, // Animate the width/height of targets as the layout changes
                effects: 'fade rotateX(-40deg) translateZ(-100px)'
            },
            layout: {
                containerClass: 'grid' // Add the class 'grid' to the container on load
            }
        });
        // MixItUp does not provide a default "change layout" button, so we need to make our own and bind it with a click handler:
        $changeLayout.on('click', function () {
            // If the current layout is a list, change to grid:
            if (layout == 'grid') {
                layout = 'list';
                $changeLayout.text('Grid'); // Update the button text
                $container.mixItUp('changeLayout', {
                    containerClass: layout // change the container class to "grid"
                });
                // Else if the current layout is a grid, change to list:  
            } else {
                layout = 'grid';
                $changeLayout.text('List'); // Update the button text
                $container.mixItUp('changeLayout', {
                    containerClass: layout // Change the container class to 'list'
                });
            }
        });
    });

}
/*------------------------------------------------------------------
    End of Call all function for Ajax
-------------------------------------------------------------------*/

// Tabs
$('ul.tabs').tabs();

// Modal
$('.modal-trigger').leanModal();

// Accordion
$('.collapsible').collapsible({
    accordion: true
});

// Drag
$('.drag-target').remove();

// Right Sidebar
$('#open-right').sideNav({ // Trigger id
    menuWidth: 280, // Default is 240
    edge: 'right', // Choose the horizontal origin
    closeOnClick: false // Closes side-nav on <a> clicks, useful for Angular/Meteor
});

// Left Sidebar
$('#open-left').sideNav({ // Trigger id
    menuWidth: 280, // Default is 240
    edge: 'left', // Choose the horizontal origin
    closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
});

// Swipebox
$('.swipebox').swipebox();

// Masonry
$('.grid').masonry({
    itemSelector: '.grid-item'
});

// Material Layout
$('.parallax').parallax();
$(function () {
    var hBanner = $('.hero-material').height();
    var cbHeight = hBanner - 86;
    var hHeight = hBanner - 86; // for Title
    $(window).scroll(function () {
        var scroll = $(window).scrollTop();
        if (scroll >= cbHeight) {
            $(".nav-material").addClass('nav-bg');
        }
        if (scroll <= cbHeight) {
            $(".nav-material").removeClass('nav-bg');
        }
        // For heading Title
        if (scroll >= hHeight) {
            $(".banner-title").hide();
            $(".nav-material .title").show();
        }
        if (scroll <= hHeight) {
            $(".banner-title").show();
            $(".nav-material .title").hide();
        }
    });
});

// Add Primary Color To Header After Scroll Down
$(function() {
    //caches a jQuery object containing the header element
    var header = $("#toolbar.transparent");
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();

        if (scroll >= 350) {
            header.removeClass('transparent').addClass("primary-color");
        } else {
            header.removeClass("primary-color").addClass('transparent');
        }
    });
});

// Sliders
var swiper = new Swiper('.swiper-slider', { // Default
    pagination: '.swiper-pagination',
    paginationClickable: true,
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
    autoplay: false,
    loop: true,
    paginationType: 'progress',
});

var swiper = new Swiper('.testimonials', { // Testimonial
    pagination: '.swiper-pagination',
    slidesPerView: 1,
    centeredSlides: true,
    paginationClickable: true,
    spaceBetween: 20,
    loop: true,
});

var swiper = new Swiper('.slider-sliced', { // Sliced
    pagination: '.swiper-pagination',
    slidesPerView: 1,
    centeredSlides: true,
    paginationClickable: true,
    spaceBetween: 0,
});

var swiper = new Swiper('.swiper-slider-full', { // Sliced
    pagination: '.swiper-pagination',
    slidesPerView: 1,
    centeredSlides: true,
    paginationClickable: true,
    spaceBetween: 0,
});

var swiper = new Swiper('.slider-drawer', { // Drawer
    pagination: '.swiper-pagination',
    slidesPerView: 1,
    centeredSlides: true,
    paginationClickable: true,
    spaceBetween: 0,
});

var swiper = new Swiper('.steps', { // Walkthrough
    pagination: '.swiper-pagination',
    slidesPerView: 1,
    centeredSlides: true,
    paginationClickable: true,
    spaceBetween: 0,
});

// MixItUp
$(function () {
    var layout = 'grid', // Store the current layout as a variable
        $container = $('#filter'), // Cache the MixItUp container
        $changeLayout = $('#ChangeLayout'); // Cache the changeLayout button
    // Instantiate MixItUp with some custom options:
    $container.mixItUp({
        animation: {
            animateChangeLayout: true, // Animate the positions of targets as the layout changes
            animateResizeTargets: true, // Animate the width/height of targets as the layout changes
            effects: 'fade rotateX(-40deg) translateZ(-100px)'
        },
        layout: {
            containerClass: 'grid' // Add the class 'list' to the container on load
        }
    });
    // MixItUp does not provide a default "change layout" button, so we need to make our own and bind it with a click handler:
    $changeLayout.on('click', function () {
        // If the current layout is a list, change to grid:
        if (layout == 'grid') {
            layout = 'list';
            $changeLayout.text('Grid'); // Update the button text
            $container.mixItUp('changeLayout', {
                containerClass: layout // change the container class to "grid"
            });
            // Else if the current layout is a grid, change to list:  
        } else {
            layout = 'grid';
            $changeLayout.text('List'); // Update the button text
            $container.mixItUp('changeLayout', {
                containerClass: layout // Change the container class to 'list'
            });
        }
    });
  
    // init swiper layout
    window.onload = function () {
        setTimeout(function () {
            ResizeHandler = ResizeHandler || function () { };
            ResizeHandler();
        }, 500)
    };

});