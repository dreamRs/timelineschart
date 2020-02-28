HTMLWidgets.widget({

  name: 'timelines',

  type: 'output',

  factory: function(el, width, height) {

    var colorScale;

    const timelinesWidget = TimelinesChart();

    return {

      renderValue: function(x) {

        if (x.options.scale.discrete) {
          colorScale = d3.scaleOrdinal(x.options.scale.palette)
            .domain(x.options.scale.domain);
        } else {
          colorScale = d3.scaleSequential(d3['interpolate' + x.options.scale.palette])
            .domain(x.options.scale.domain);
        }

        var maxHeight = height;
        if (x.options.overview.enable) {
          maxHeight = height - 50;
        }

        timelinesWidget
          .data(x.data)
          .width(width)
          .maxHeight(maxHeight)
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
          .enableOverview(x.options.overview.enable);

        timelinesWidget
          (document.getElementById(el.id));

        if (x.options.zoom.x !== null) {
          var minZoom = new Date(x.options.zoom.x[0]);
          var maxZoom = new Date(x.options.zoom.x[1]);
          timelinesWidget.zoomX([minZoom, maxZoom]);
        }
        if (x.options.zoom.y !== null) {
          timelinesWidget.zoomY(x.options.zoom.y);
        }

        if (x.options.overview.domain !== null) {
          //console.log(timelinesWidget.overviewDomain());
          var minTs = new Date(x.options.overview.domain[0]);
          var maxTs = new Date(x.options.overview.domain[1]);
          timelinesWidget
            .overviewDomain([minTs, maxTs]);
        }

      },

      getChart: function() {
        return timelinesWidget;
      },

      resize: function(width, height) {

      }

    };
  }
});

// From Friss tuto (https://github.com/FrissAnalytics/shinyJsTutorials/blob/master/tutorials/tutorial_03.Rmd)
function get_timelines(id){

  // Get the HTMLWidgets object
  var htmlWidgetsObj = HTMLWidgets.find("#" + id);

  // Use the getChart method we created to get the underlying billboard chart
  var timelinesObj ;

  if (typeof htmlWidgetsObj != 'undefined') {
    timelinesObj = htmlWidgetsObj.getChart();
  }

  return(timelinesObj);
}

if (HTMLWidgets.shinyMode) {

  Shiny.addCustomMessageHandler('update-timelines-zoom',
    function(message) {
      var timelinesWidget = get_timelines(message.id);
      if (typeof timelinesWidget != 'undefined') {
        if (message.data.x !== null) {
          var minZoom = new Date(message.data.x[0]);
          var maxZoom = new Date(message.data.x[1]);
          timelinesWidget.zoomX([minZoom, maxZoom]);
        }
        if (message.data.y !== null) {
          timelinesWidget.zoomY(message.data.y);
        }
      }
  });

  Shiny.addCustomMessageHandler('update-timelines-data',
    function(message) {
      var timelinesWidget = get_timelines(message.id);
      if (typeof timelinesWidget != 'undefined') {
        timelinesWidget.data(message.data.newData);
      }
  });

}
