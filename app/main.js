(function() {

  function hideLoader() {
    document.getElementById('loader').style.display = 'none';
  }
  function showLoader() {
    document.getElementById('loader').style.display = 'block';
  }

  window.onload = function() {
    showLoader();
    var socket = io.connect();
    socket.on('connect', function() {
      hideLoader();
      var term = new Terminal({
        cols: 80,
        rows: 24
      });

      term.on('data', function(data) {
        socket.emit('data', data);
      });

      term.on('title', function(title) {
        document.title = title;
      });

      term.open(document.body);

      term.write('welcome to whim terminal!\x1b[m\r\n');

      socket.on('data', function(data) {
        term.write(data);
      });

      socket.on('disconnect', function() {
        term.destroy();
      });
    });
  };
}).call(this);