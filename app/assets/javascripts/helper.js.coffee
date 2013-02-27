$(document).ready ->
	# opens links as popup, just add data-popup="true" to the link
  $('a[data-popup]').click ->
    nw = window.open($(this).attr('href'), '', 'height=300,width=500')
    if window.focus then nw.focus()
    false
  
