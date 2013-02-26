# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.Provo.Ideas = {}

window.Provo.Ideas.refreshVote = (resource) ->
	$.ajax(resource + "/user_vote_status").done (data) ->
		$("#context_links a.active").removeClass("active")
		if data == "up"
			$("#context_links a.up").addClass("active")
			#$("#context_links a.up").attr("href", $("#context_links a.up").attr("href").replace("kind=like", "kind=unlike"))
		else if data == "down"
			$("#context_links a.down").addClass("active")
			#$("#context_links a.down").attr("href", $("#context_links a.down").attr("href").replace("kind=dislike", "kind=undislike"))
		#else
		#	$("#context_links a.up").attr("href", $("#context_links a.up").attr("href").replace("kind=unlike", "kind=like"))
		#	$("#context_links a.down").attr("href", $("#context_links a.down").attr("href").replace("kind=undislike", "kind=dislike"))			
		return
	return
