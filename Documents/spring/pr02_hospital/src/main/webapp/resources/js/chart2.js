const dataSource = {
  chart: {
    caption: "App Publishing Trend",
    subcaption: "2019.01-2019.12",
    xaxisname: "Years",
    yaxisname: "Total number of apps in store",
    formatnumberscale: "1",
    plottooltext:
      "<b>$dataValue</b> apps were available on <b>$seriesName</b> in $label",
    theme: "fusion",
    drawcrossline: "1"
  },
  categories: [
    {
      category: [
        {
          label: "01"
        },
        {
          label: "02"
        },
        {
          label: "03"
        },
        {
          label: "04"
        },
        {
          label: "05"
        },
        {
          label: "06"
        },
        {
          label: "07"
        },
        {
          label: "08"
        },
        {
          label: "09"
        },
        {
          label: "10"
        },
        {
          label: "11"
        },
        {
          label: "12"
        },
        
        
      ]
    }
  ],
  dataset: [
    {
      seriesname: "일반 내원",
      data: [
        {
          value: "125000"
        },
        {
            value: "100000"
        },
        {
          value: "300000"
        },
        {
          value: "480000"
        },
        {
          value: "800000"
        },
        {
          value: "1100000"
        },
        {
            value: "1000000"
          },
          {
              value: "1250000"
            },
            {
                value: "1350000"
              },
              {
                  value: "1120000"
                },
                {
                    value: "1000000"
                  },
                  {
                      value: "1200000"
                    },
      ]
    },
    {
      seriesname: "인터넷 광고",
      data: [
        {
          value: "70000"
        },
        {
          value: "150000"
        },
        {
          value: "350000"
        },
        {
          value: "600000"
        },
        {
          value: "1400000"
        },
        {
            value: "2000000"
        },
        {
            value: "2100000"
        },
        {
            value: "2000000"
        }
        ,
        {
          value: "1900000"
        }
        ,
        {
          value: "2000000"
        }
        ,
        {
          value: "1700000"
        }
        ,
        {
          value: "1800000"
        }
      ]
    },
    {
        seriesname: "버스 광고",
        data: [
          {
            value: "30000"
          },
          {
            value: "100000"
          },
          {
            value: "200000"
          },
          {
            value: "300000"
          },
          {
            value: "400000"
          }
          ,
          {
            value: "300000"
          }
          ,
          {
            value: "350000"
          }
          ,
          {
            value: "400000"
          }
          ,
          {
            value: "500000"
          }
          ,
          {
            value: "600000"
          }
          ,
          {
            value: "800000"
          }
          ,
          {
            value: "550000"
          }
        ]
      },
    {
      seriesname: "지인추천",
      data: [
        {
          value: "10000"
        },
        {
          value: "40000"
        },
        {
          value: "80000"
        },
        {
          value: "160000"
        },
        {
          value: "200000"
        }
        ,
        {
          value: "400000"
        }
        ,
        {
          value: "500000"
        }
        ,
        {
          value: "700000"
        }
        ,
        {
          value: "900000"
        }
        ,
        {
          value: "1100000"
        }
        ,
        {
          value: "1300000"
        }
        ,
        {
          value: "1200000"
        }
      ]
    }
  ]
};

FusionCharts.ready(function() {
  var myChart = new FusionCharts({
    type: "mscolumn2d",
    renderAt: "chart-container",
    width: "100%",
    height: "100%",
    dataFormat: "json",
    dataSource
  }).render();
});