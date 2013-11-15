(function() {
  var loadthis;

  loadthis = {
    image: function(opts, done, fail) {
      var img;
      img = new Image;
      img.onload = function() {
        if (('naturalWidth' in this && (this.naturalWidth + this.naturalHeight === 0)) || (this.width + this.height === 0)) {
          return fail(new Error("Image <" + opts.url + "> could not be loaded."));
        } else {
          return done(img);
        }
      };
      img.onerror = function(err) {
        return fail(err);
      };
      img.src = opts.url;
    },
    text: function(opts, done, fail) {
      $.ajax({
        url: src,
        dataType: 'text',
        success: function(data) {
          return done($(data));
        },
        error: function(err) {
          return fail(err);
        }
      });
    }
  };

  loadthis.html = loadthis.text;

  loadthis.inlineSvg = loadthis.text;

  this.loadthis = loadthis;

}).call(this);
