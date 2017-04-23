// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


// ===========  Loading screen =============
// $(window).load(function(){
// 	 $('#loading_screen').fadeOut('slow');
// });
// -------------------------------


$(document).ready(function() {
	 // $('#loading_screen').fadeOut('slow');
	// ======= admin form click  ==========
	if ($('#create').is(':visible')){
		document.getElementById("create").addEventListener("click", addForm);
	}	

	function addForm(e){
		e.preventDefault()
		$.ajax({
			url: '/admins/new'
		}).done(function(response){
			$('#admin_holder').html(response)
			$('.admin').css('display', 'none')
			$('.admin').slideDown()
			$('html, body').animate({
	      scrollTop: $(".new").offset().top
			 }, 1000);
			document.getElementById("create").removeEventListener("click", addForm);
			document.getElementById("create").addEventListener("click", formSlide);
			$('#user_holder').slideUp()
		})
	}
	// -------------------------------


	// ======= user form click  ==========
	if ($('#login').is(':visible')){
		document.getElementById("login").addEventListener("click", addUserForm);
	}	

	function addUserForm(e){
		e.preventDefault()
		$.ajax({
			url: '/users/new'
		}).done(function(response){
			$('#user_holder').html(response)
			$('.user').css('display', 'none')
			$('.user').slideDown()
			$('html, body').animate({
	      scrollTop: $(".user").offset().top
			 }, 1000);
			document.getElementById("login").removeEventListener("click", addUserForm);
			$('.new').slideUp()
			document.getElementById("login").addEventListener("click", userFormSlide);
		})
	}
	// -------------------------------



	// ======= form slides ==========
	function formSlide(){
		$('.new').slideToggle()
		$('#user_holder').slideUp()
		$('html, body').animate({
	      scrollTop: $(".new").offset().top
			 }, 1000);
	}

	function userFormSlide(){
		$('#user_holder').slideToggle()
		$('.new').slideUp()
		$('html, body').animate({
	      scrollTop: $("#user_holder").offset().top
			 }, 1000);
	}
	// -------------------------------

	

	// ======= admin submit ==========
	$('header').on('submit', '#admin', function(e){
		e.preventDefault()
		$.ajax({
			url: $(e.target).attr('action'),
			method: $(e.target).attr('method'),
			data: $(e.target).serialize()
		}).done(function(response){
			$( "#admin" ).fadeOut()
			
			setTimeout(function(){
				$('#admin').remove()
				$('.new').html(response)
				$('#league').css('display', 'none')
				$( "#league" ).fadeIn() 
		    $('html, body').animate({
		      scrollTop: $("#league").offset().top
				 }, 1000);
	    }, 300);
	    

		}).fail(function(failure){
			if (!$('.errors-list').is(':visible')){
				$(e.target).before(failure.responseText)
			}
			$('html, body').animate({
	      scrollTop: $(".errors-list").offset().top
			 }, 1000);
			$('#admin input.submit').attr('disabled', false);
		})
	})
	// -------------------------------



	// Admin login click
	$('html').on('click touch', '#admin_login_form', function(e){
		$('.user').fadeOut()
		$('.admin_login').fadeIn()
	})

	$('html').on('click touch', '#user_login_form', function(e){
		$('.admin_login').fadeOut()
		$('.user').fadeIn()
	})
	// --------------------------------



// ======= user submit ==========
	$('header').on('submit', '#user', function(e){
		e.preventDefault()
		$.ajax({
			url: $(e.target).attr('action'),
			method: $(e.target).attr('method'),
			data: $(e.target).serialize()
		}).done(function(response){

			// $( "#login" ).fadeOut()

		}).fail(function(failure){
			if (!$('.errors-list').is(':visible')){
				$(e.target).before(failure.responseText)
			}
			$('html, body').animate({
	      scrollTop: $(".errors-list").offset().top
			 }, 1000);
			$('#user input.submit').attr('disabled', false);
		})
	})
	// -------------------------------



// ======= admin login ==========
	$('header').on('submit', '#admin_login', function(e){
		e.preventDefault()
		$.ajax({
			url: $(e.target).attr('action'),
			method: $(e.target).attr('method'),
			data: $(e.target).serialize()
		}).done(function(response){

			// $( "#login" ).fadeOut()

		}).fail(function(failure){
			if (!$('.errors-list').is(':visible')){
				$(e.target).before(failure.responseText)
			}
			$('html, body').animate({
	      scrollTop: $(".errors-list").offset().top
			 }, 1000);
			$('#admin_login input.submit').attr('disabled', false);
		})
	})
	// -------------------------------




	// ======= league submit ==========
	$('header').on('submit', '#league', function(e){
		e.preventDefault()
		$.ajax({
			url: $(e.target).attr('action'),
			method: $(e.target).attr('method'),
			data: $(e.target).serialize()
		}).done(function(response){
			$( "#league" ).fadeOut()

			setTimeout(function(){
				$('#league').remove()
				$('.new').html(response)
				$('#team').css('display', 'none')
				$( "#team" ).fadeIn() 
				$('html, body').animate({
	      scrollTop: $("#team").offset().top
			 }, 1000);
	    }, 300);

		}).fail(function(failure){
			$('.errors-list').hide()
			if (!$('.errors-list').is(':visible')){
				$(e.target).before(failure.responseText)
			}
			$('html, body').animate({
	      scrollTop: $(".errors-list").offset().top
			 }, 1000);
			$('#league input.submit').attr('disabled', false);
		})
	})
	// -------------------------------



	// ======= # of players submit ==========
	$('header').on('submit', '#team', function(e){
		e.preventDefault()
		$.ajax({
			url: $(e.target).attr('action'),
			method: $(e.target).attr('method'),
			data: $(e.target).serialize()
		}).done(function(response){
			$( "#team" ).fadeOut()
			
			setTimeout(function(){
				$('#team').remove()
				$('.new').html(response)
				$('.player').css('display', 'none')
				$( ".player" ).fadeIn() 

				$('html, body').animate({
	        scrollTop: $("#player").offset().top
		    }, 1000);
	    }, 300);

		}).fail(function(failure){
			$('.errors-list').hide()
			if (!$('.errors-list').is(':visible')){
				$(e.target).before(failure.responseText)
			}
			$('html, body').animate({
	      scrollTop: $(".errors-list").offset().top
			 }, 1000);
			$('#team input.submit').attr('disabled', false);
		})
	})
	// -------------------------------



	// ======= players name submit ==========
	$('header').on('submit', '#player', function(e){
		e.preventDefault()
		$.ajax({
			url: $(e.target).attr('action'),
			method: $(e.target).attr('method'),
			data: $(e.target).serialize()
		}).done(function(response){
			$(e.target.children[2]).css('background-color', '#118866')
			$(e.target.children[e.target.children.length -1]).css('background-color', '#118866')


			setTimeout(function(){
        $(e.target.children[2]).css('background-color', '#38BC9C')
				$(e.target.children[e.target.children.length -1]).css('background-color', '#38BC9C')
	    }, 1000);

		$('#player input.submit').attr('disabled', false);

			

		}).fail(function(failure){
			$('.errors-list').hide()
			if (!$('.errors-list').is(':visible')){
				$(e.target).before(failure.responseText)
			}
			$('html, body').animate({
	      scrollTop: $(".errors-list").offset().top
			 }, 1000);
			$('#player input.submit').attr('disabled', false);
		})
	})
	// -------------------------------


	// ======= Showing players ==========
	$('html').on('click touch', '#players_button', function(e){
		$('#players').slideToggle()
		$('html, body').animate({
      scrollTop: $("#players").offset().top
		 }, 1000);
	})
	// -------------------------------


	// ======= Showing teams ==========
	$('html').on('click touch', '#teams_button', function(){
		$('#teams').slideToggle()
		$('html, body').animate({
      scrollTop: $("#teams").offset().top
		 }, 1000);
	})
	// -------------------------------


	// ======= Showing matches ==========
	$('html').on('click touch', '#matches_button', function(){
		$('#matches').slideToggle()
		$('.curr_week').slideToggle()
		$('html, body').animate({
      scrollTop: $("#matches").offset().top
		 }, 1000);
	})
	// -------------------------------


	// ======= showing games to add scores ==========
	$('html').on('click tap', 'div.match', function(e){
		$(this).slideToggle(0)
		$(this).next().slideToggle('.box').css('display', 'inline-block')
	})
	// -------------------------------


	// ======= showing finished side ==========
	$('html').on('click tap', '.score_result', function(e){
		$(this).parents('.complete').slideToggle(0)
		$(this).parent('.complete').prev().slideToggle()
	})
	// -------------------------------



	// ======= Unshowing games to add scores ==========
	$('html').on('click tap', '.scores', function(e){
		$(this).parents('.game_holder.box').prev().slideToggle()
		$(this).parent('.game_holder.box').slideToggle(0)
		// $('.game').slideUp()
	})
	// -------------------------------



	// ======= showing games form add scores ==========
	$('html').on('click tap', '.game', function(e){
		$(this).next().slideToggle()
		$(this).toggleClass('active')
	})
	// -------------------------------



	// ======= Team score submit ==========
	$('html').on('submit', '#score', function(e){
		e.preventDefault()
		$.ajax({
			url: $(e.target).attr('action'),
			method: $(e.target).attr('method'),
			data: $(e.target).serialize()
		}).done(function(response){
			$('.errors-list').hide()
			$(e.target).hide().html(response).fadeIn()
	    $(e.target).children('.submit').attr('disabled', false);

		}).fail(function(failure){
			$('.errors-list').hide()
			if (!$('.errors-list').is(':visible')){
				$(e.target).before(failure.responseText)
			}
			$('html, body').animate({
	      scrollTop: $(".errors-list").offset().top
			 }, 1000);
			$('#score input.submit').attr('disabled', false);
		})
	})
	// -------------------------------





})








