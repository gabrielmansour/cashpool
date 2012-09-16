window.Cashpool = Cashpool =
  init: ->
    # event binding:
    jQuery ($)=>
      $("a#invite_friends").on "click", @show_invite_friends_dialog

  show_invite_friends_dialog: ->
    #console.log "show invite friends dialog"
    FB.ui {
      method: 'apprequests'
      title: 'Select friends to invite to this group'
      message: "You have been added to my group"
      display: 'dialog'
    }, (response) =>
      Cashpool.add_members(response.to)
    false

  # TODO For security, add server-side check to ensure users are friends with current user as added security
  add_members: (fb_ids) ->
    $.ajax
      url: $("a#invite_friends").data('url')
      type: 'post'
      data:
        ids: fb_ids
        authenticity_token: $('meta[name=csrf-token]').attr('content')
      dataType: 'json'
      success: (response)->
        window.location.reload true



Cashpool.init()
