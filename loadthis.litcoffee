    loadthis =
      image: (opts, done, fail) ->
        img = new Image
        img.onload = ->
          if ('naturalWidth' of this and (@naturalWidth + @naturalHeight == 0)) or (@width + @height == 0)
            fail new Error "Image <#{ opts.url }> could not be loaded."
          else
            done img
        img.onerror = (err) -> fail err
        img.src = opts.url
        return

      text: (opts, done, fail) ->
        $.ajax
            url: opts.url
            dataType: 'text'
            success: (data) ->
                done $ data
            error: (xhr, status, err) ->
                fail err
        return

    loadthis.html = loadthis.text
    loadthis.inlineSvg = loadthis.text

'Export' the loadthis 'module'

    @loadthis = loadthis
