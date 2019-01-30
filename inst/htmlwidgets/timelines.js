HTMLWidgets.widget({

  name: 'timelines',

  type: 'output',

  factory: function(el, width, height) {

    var colorScale;

    return {

      renderValue: function(x) {

        if (x.options.scale.discrete) {
          colorScale = d3.scaleOrdinal(x.options.scale.palette)
            .domain(x.options.scale.domain);
        } else {
          colorScale = d3.scaleSequential(d3['interpolate' + x.options.scale.palette])
            .domain(x.options.scale.domain);
        }

        const timelinesWidget = TimelinesChart();

        timelinesWidget
          .data(x.data)
          .width(width)
          .maxHeight(height)
          .maxLineHeight(x.options.maxLineHeight)
          .leftMargin(x.options.margins.left)
          .rightMargin(x.options.margins.right)
          .bottomMargin(x.options.margins.bottom)
          .topMargin(x.options.margins.top)
          .zQualitative(x.options.scale.discrete)
          .zDataLabel(x.options.scale.data_label)
          .zScaleLabel(x.options.scale.label)
          .zColorScale(colorScale)
          .useUtc(x.options.time.useUTC)
          .timeFormat(x.options.time.format)
          (document.getElementById(el.id));

      },

      resize: function(width, height) {

      }

    };
  }
});
