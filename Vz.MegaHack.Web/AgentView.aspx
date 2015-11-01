<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgentView.aspx.cs" Inherits="Vz.MegaHack.Web.AgentView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cozy 3.0 - Call Center Workforce Optimization</title>
    <script src="Content/Scripts/Libs/jquery-1.10.2.min.js"></script>
    <script src="Content/Scripts/Libs/jquery.layout.js"></script>
    <a href="AgentView.aspx">AgentView.aspx</a>
    <script src="Content/Scripts/Libs/customEvents.js"></script>
    <script src="Content/Scripts/Libs/highstock.js"></script>
    <script src="Content/Scripts/Libs/highcharts-3d.js"></script>
    <%--<script src="https://code.highcharts.com/stock/highstock.js"></script>
    <script src="https://code.highcharts.com/highcharts-3d.js"></script>--%>
    <link href="Content/Styles/tablestyle.css" rel="stylesheet" />

    <script type="text/javascript">
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        function goback() {
            window.location.href = "SupView.aspx?cid=" + getParameterByName('cid') + "&sid=" + getParameterByName('sid');
        }

        $(document).ready(function () {
            $('body').layout({ applyDefaultStyles: true });

            var centerid = getParameterByName('cid');
        });

        function onChartLoad() {
            var radius,
                label,
                left,
                right,
                renderer;

            if (this.chartWidth < 530) {
                return;
            }

            // Prepare mouseover
            renderer = this.renderer;
            if (renderer.defs) { // is SVG
                $.each(this.get('employees').points, function () {
                    var point = this,
                        pattern;
                    if (point.image) {
                        pattern = renderer.createElement('pattern').attr({
                            id: 'pattern-' + point.image,
                            patternUnits: 'userSpaceOnUse',
                            width: 400,
                            height: 400
                        }).add(renderer.defs);

                        Highcharts.addEvent(point, 'mouseOver', function () {
                            empImage
                                .attr({
                                    fill: 'url(#pattern-' + point.image + ')'
                                })
                                .animate({ opacity: 1 }, { duration: 500 });
                        });
                        Highcharts.addEvent(point, 'mouseOut', function () {
                            empImage.animate({ opacity: 0 }, { duration: 500 });
                        });
                    }
                });
            }
        }

        $(function () {
            Highcharts.setOptions({
                chart: {
                    events: {
                        load: onChartLoad
                    }
                },
                exporting: {
                    enabled: false
                },
                credits: {
                    enabled: false
                },
                tooltip: {
                    style: {
                        width: '250px'
                    }
                },

                plotOptions: {
                    series: {
                        marker: {
                            enabled: false,
                            symbol: 'circle',
                            radius: 2
                        },
                        fillOpacity: 0.5
                    },
                    flags: {
                        tooltip: {
                            xDateFormat: '%B %e, %Y'
                        }
                    }
                }
            });

            var options = {
                xAxis: {
                    type: 'datetime',
                    minTickInterval: 30 * 24 * 36e5,
                    labels: {
                        align: 'left'
                    },
                    plotBands: [{
                        from: Date.UTC(2015, 0, 1),
                        to: Date.UTC(2015, 2, 31),
                        color: '#EFFFFF',
                        label: {
                            text: '<em>Quarter1</em>',
                            style: {
                                color: '#999999'
                            },
                            y: 10
                        }
                    }, {
                        from: Date.UTC(2015, 3, 1),
                        to: Date.UTC(2015, 5, 30),
                        color: '#FFFFEF',
                        label: {
                            text: '<em>Quarter2</em>',
                            style: {
                                color: '#999999'
                            },
                            y: 10
                        }
                    }, {
                        from: Date.UTC(2015, 6, 1),
                        to: Date.UTC(2015, 8, 30),
                        color: '#FFEFFF',
                        label: {
                            text: '<em>Quarter3</em>',
                            style: {
                                color: '#999999'
                            },
                            y: 10
                        }
                    }, {
                        from: Date.UTC(2015, 9, 1),
                        to: Date.UTC(2015, 11, 31),
                        color: '#FFEFFF',
                        label: {
                            text: '<em>Quarter4</em>',
                            style: {
                                color: '#999999'
                            },
                            y: 10
                        }
                    }]

                },
                yAxis: [{
                    max: 100,
                    allowDecimals: false,
                    labels: {
                        style: {
                            color: Highcharts.getOptions().colors[2]
                        },
                        enabled: true
                    },
                    title: {
                        text: 'Performance Points',
                        style: {
                            color: Highcharts.getOptions().colors[2]
                        }
                    },
                    gridLineColor: 'rgba(0, 0, 0, 0.07)',
                    opposite: true,
                    gridLineWidth: 0
                }]
            };

            var kpichart1Options = {
                chart: {
                    renderTo: 'chart_Container_KPI1'
                },
                title: {
                    text: '<%= agentViewInfo.AgentView[0].KPIName.ToString() %>'
                },
                series: [{
                    yAxis: 0,
                    name: 'Center Average',
                    id: 'revenue',
                    type: 'area',
                    data: [<%= centerAverage[0].ToString()%>],
                    tooltip: {
                        headerFormat: '<span style="font-size: 11px;color:#666">{point.x:%B %e, %Y}</span><br>',
                        valueSuffix: ' %'
                    }

                }, {
                    yAxis: 0,
                    name: 'Agent Performance',
                    id: 'employees',
                    type: 'area',
                    //step: 'left',
                    tooltip: {
                        headerFormat: '<span style="font-size: 11px;color:#666">{point.x:%B %e, %Y}</span><br>',
                        //pointFormat: '{point.name}<br><b>{point.y}</b>',
                        valueSuffix: ' %'
                    },
                    data: [<%= kpiScores[0].ToString()%>]

                }]
            };
            if (Highcharts.seriesTypes.flags) {
                kpichart1Options.series.push({
                    type: 'flags',
                    name: 'Training',
                    color: '#333333',
                    y: -5,
                    fillColor: 'rgba(255,255,255,0.8)',
                    data: [<%= Training[0].ToString()%>],
                    onSeries: 'employees',
                    showInLegend: false
                });
                kpichart1Options.series.push({
                    type: 'flags',
                    name: 'Awards',
                    color: '#333333',
                    fillColor: 'green',
                    data: [<%= Award[0].ToString()%>],
                    onSeries: 'employees',
                    showInLegend: false
                });
            }
            kpichart1Options = jQuery.extend(true, {}, options, kpichart1Options);
            var kpiChart1 = new Highcharts.Chart(kpichart1Options);

            var kpichart2Options = {
                chart: {
                    renderTo: 'chart_Container_KPI2'
                },
                title: {
                    text: '<%= agentViewInfo.AgentView[1].KPIName.ToString() %>'
                },
                series: [{
                    yAxis: 0,
                    name: 'Center Average',
                    id: 'revenue',
                    type: 'area',
                    data: [<%= centerAverage[1].ToString()%>],
                    tooltip: {
                        headerFormat: '<span style="font-size: 11px;color:#666">{point.x:%B %e, %Y}</span><br>',
                        valueSuffix: ' %'
                    }

                }, {
                    yAxis: 0,
                    name: 'Agent Performance',
                    id: 'employees',
                    type: 'area',
                    //step: 'left',
                    tooltip: {
                        headerFormat: '<span style="font-size: 11px;color:#666">{point.x:%B %e, %Y}</span><br>',
                        //pointFormat: '{point.name}<br><b>{point.y}</b>',
                        valueSuffix: ' %'
                    },
                    data: [<%= kpiScores[1].ToString()%>]

                }]
            };
            if (Highcharts.seriesTypes.flags) {
                kpichart2Options.series.push({
                    type: 'flags',
                    name: 'Training',
                    color: '#333333',
                    y: -5,
                    fillColor: 'rgba(255,255,255,0.8)',
                    data: [<%= Training[1].ToString()%>],
                    onSeries: 'employees',
                    showInLegend: false
                });
                kpichart2Options.series.push({
                    type: 'flags',
                    name: 'Awards',
                    color: '#333333',
                    fillColor: 'green',
                    data: [<%= Award[1].ToString()%>],
                    onSeries: 'employees',
                    showInLegend: false
                });
            }
            kpichart2Options = jQuery.extend(true, {}, options, kpichart2Options);
            var kpiChart2 = new Highcharts.Chart(kpichart2Options);

            var kpichart3Options = {
                chart: {
                    renderTo: 'chart_Container_KPI3'
                },
                title: {
                    text: '<%= agentViewInfo.AgentView[2].KPIName.ToString() %>'
                },
                series: [{
                    yAxis: 0,
                    name: 'Center Average',
                    id: 'revenue',
                    type: 'area',
                    data: [<%= centerAverage[2].ToString()%>],
                    tooltip: {
                        headerFormat: '<span style="font-size: 11px;color:#666">{point.x:%B %e, %Y}</span><br>',
                        valueSuffix: ' %'
                    }

                }, {
                    yAxis: 0,
                    name: 'Agent Performance',
                    id: 'employees',
                    type: 'area',
                    //step: 'left',
                    tooltip: {
                        headerFormat: '<span style="font-size: 11px;color:#666">{point.x:%B %e, %Y}</span><br>',
                        //pointFormat: '{point.name}<br><b>{point.y}</b>',
                        valueSuffix: ' %'
                    },
                    data: [<%= kpiScores[2].ToString()%>]

                }]
            };
            if (Highcharts.seriesTypes.flags) {
                kpichart3Options.series.push({
                    type: 'flags',
                    name: 'Training',
                    color: '#333333',
                    y: -5,
                    fillColor: 'rgba(255,255,255,0.8)',
                    data: [<%= Training[2].ToString()%>],
                    onSeries: 'employees',
                    showInLegend: false
                });
                kpichart3Options.series.push({
                    type: 'flags',
                    name: 'Awards',
                    color: '#333333',
                    fillColor: 'green',
                    data: [<%= Award[2].ToString()%>],
                    onSeries: 'employees',
                    showInLegend: false
                });
            }
            kpichart3Options = jQuery.extend(true, {}, options, kpichart3Options);
            var kpiChart3 = new Highcharts.Chart(kpichart3Options);

            var kpichart4Options = {
                chart: {
                    renderTo: 'chart_Container_KPI4'
                },
                title: {
                    text: '<%= agentViewInfo.AgentView[3].KPIName.ToString() %>'
                },
                series: [{
                    yAxis: 0,
                    name: 'Center Average',
                    id: 'revenue',
                    type: 'area',
                    data: [<%= centerAverage[3].ToString()%>],
                    tooltip: {
                        headerFormat: '<span style="font-size: 11px;color:#666">{point.x:%B %e, %Y}</span><br>',
                        valueSuffix: ' %'
                    }

                }, {
                    yAxis: 0,
                    name: 'Agent Performance',
                    id: 'employees',
                    type: 'area',
                    //step: 'left',
                    tooltip: {
                        headerFormat: '<span style="font-size: 11px;color:#666">{point.x:%B %e, %Y}</span><br>',
                        //pointFormat: '{point.name}<br><b>{point.y}</b>',
                        valueSuffix: ' %'
                    },
                    data: [<%= kpiScores[3].ToString()%>]

                }]
            };
            if (Highcharts.seriesTypes.flags) {
                kpichart4Options.series.push({
                    type: 'flags',
                    name: 'Training',
                    color: '#333333',
                    y: -5,
                    fillColor: 'rgba(255,255,255,0.8)',
                    data: [<%= Training[3].ToString()%>],
                    onSeries: 'employees',
                    showInLegend: false
                });
                kpichart4Options.series.push({
                    type: 'flags',
                    name: 'Awards',
                    color: '#333333',
                    fillColor: 'green',
                    data: [<%= Award[3].ToString()%>],
                    onSeries: 'employees',
                    showInLegend: false
                });
            }
            kpichart4Options = jQuery.extend(true, {}, options, kpichart4Options);
            var kpiChart4 = new Highcharts.Chart(kpichart4Options);

        });
    </script>

    <script type="text/javascript">

        $(function () {
            $('#desktop_container').highcharts({
                chart: {
                    type: 'pie'
                },
                colors: ['#50B432', '#ff8a45'],
                title: {
                    text: 'Desktop Analytics',
                    style: {
                        color: 'maroon'
                    }
                },
                credits: {
                    enabled: false
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        depth: 35,
                        dataLabels: {
                            enabled: true,
                            distance: -10,
                            format: '{point.name}'
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: 'Browser share',
                    data: [
                        ['Productive', 87.2],
                        {
                            name: 'Non-Productive',
                            y: 12.8,
                            sliced: true,
                            selected: true
                        }
                    ]
                }]
            });
        });
    </script>

    <style type="text/css">
        .active {
            border-style: solid;
            border-width: 2px;
            border-color: red;
        }

        body {
            font-family: Arial;
        }

        .topheader {
            background-color: #FF3333 !important;
            font-weight: bold;
            color: white;
        }

        .leftpane {
            background-color: #FFFFFF !important;
        }

        .rightpane {
            background-color: #363636 !important;
        }

        .rcorners {
            border-radius: 25px;
            background: #8AC007;
            padding: 20px;
            width: 118px;
            height: 110px;
        }


        #upleft {
            width: 79%;
            height: 100%;
            float: left;
            /*border-style: solid;
            border-width: 1px;
            border-right: solid;
            border-right-color: gray;*/
        }

        #upright {
            width: 40%;
            height: 100%;
            float: right;
        }

        #below {
            height: 290px;
            width: 99%;
            /*border-style: solid;*/
            border-width: 1px;
            border-top: solid;
            border-top-color: gray;
            clear: both;
        }

        .curvedimage {
            border-top-right-radius: 50% 10%;
            border-top-left-radius: 50% 10%;
            border-bottom-right-radius: 50% 10%;
            border-bottom-left-radius: 50% 10%;
            width: 130px;
            height: 130px;
        }

        .ui-layout-resizer-east {
            right: 40% !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="ui-layout-center">
           <table class="table-responsive" style="width:100%">
                    <tr>
                        <td id="chart_Container_KPI1" style="min-width: 400px; max-width: 550px; height: 300px; margin: 1em auto"></td>
                        <td id="chart_Container_KPI2" style="min-width: 400px; max-width: 550px; height: 300px; margin: 1em auto"></td>
                        <td style="min-width: 400px; max-width: 550px; height: 300px;">
                            <h3 style="color:maroon; margin-top: -10px">Agent Call History</h3>
                            <table class='features-table'>
                    <thead>
                        <tr>
                            <td>Customer Name</td>
                            <td>Call Duration</td>
                            <td>Alerts</td>
                            <td>Listen</td>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <td style="text-align: right" colspan="4">More...</td>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr>
                            <td>Steen O Brien</td>
                            <td>00:15:00</td>
                            <td>0</td>
                            <td><img src="Content/Images/ListenIcon.png" height="20" /></td>
                        </tr>
                        <tr>
                            <td>Mandy McDonnell</td>
                            <td>00:35:14</td>
                            <td>3</td>
                            <td><img src="Content/Images/ListenIcon.png" height="20" /></td>
                        </tr>
                        <tr>
                            <td>Cyril Behin</td>
                            <td>00:25:10</td>
                            <td>2</td>
                            <td><img src="Content/Images/ListenIcon.png" height="20" /></td>
                        </tr>
                        </tbody>
                </table>
                        </td>
                    </tr>
                    <tr>
                        <td id="chart_Container_KPI3" style="min-width: 400px; max-width: 550px; height: 300px; margin: 1em auto"></td>
                        <td id="chart_Container_KPI4" style="min-width: 400px; max-width: 550px; height: 300px; margin: 1em auto"></td>
                        <td id="desktop_container" style="height: 300px; min-width: 450px; max-width:500px; background-color:gray"></td>
                    </tr>
                </table>
            <%--<div id="upright">
                <table>
                <tr>
                    <td id="desktop_container" style="height:400px"></td>
                </tr>
                <%--<tr>
                    <td>Call</td>
                    <td>Duration</td>
                    <td><img src="Content/Images/ListenIcon.png" height="20" /></td>
                </tr>
                <tr>
                    <td>Call</td>
                    <td>Duration</td>
                    <td><img src="Content/Images/ListenIcon.png" height="20" /></td>
                </tr>
                <tr>
                    <td>Call</td>
                    <td>Duration</td>
                    <td><img src="Content/Images/ListenIcon.png" height="20" /></td>
                </tr>
                <tr>
                    <td>Call</td>
                    <td>Duration</td>
                    <td><img src="Content/Images/ListenIcon.png" height="20" /></td>
                </tr>
            </table>
            </div>--%>
        </div>
        <%--<div class="ui-layout-east rightpane" style="background-color: #363636; width: 40% !important;">
            
        </div>--%>
        <div class="ui-layout-north topheader">
            Cozy 3.0 - Call Center Workforce Optimization
            <div style="float: right; color: yellow" id="divAgentName"></div>
            <div style="float: right">Agent Name: <%= agentViewInfo.AgentName %> </div>
        </div>


    </form>
</body>
</html>
