HTMLWidgets.widget({

  name: 'timelines',

  type: 'output',

  factory: function(el, width, height) {

    return {

      renderValue: function(x) {

        const timelinesWidget = TimelinesChart();

        timelinesWidget
          .data(x.data)
          .width(width)
          .maxHeight(height)
          (document.getElementById(el.id));

      },

      resize: function(width, height) {

      }

    };
  }
});
