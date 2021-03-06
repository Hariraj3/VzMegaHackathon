﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CenterView.aspx.cs" Inherits="Vz.MegaHack.Web.CenterView" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cozy 3.0 - Call Center Workforce Optimization</title>
    <script src="Content/Scripts/Libs/jquery-1.10.2.min.js"></script>
    <script src="Content/Scripts/Libs/jquery.layout.js"></script>
    <script src="Content/Scripts/Libs/highcharts.js"></script>
    <script src="Content/Scripts/Libs/customEvents.js"></script>
    <link href="Content/Styles/tablestyle.css" rel="stylesheet" />

    <script type="text/javascript">

        // Radialize the colors
        Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
            return {
                radialGradient: {
                    cx: 0.5,
                    cy: 0.3,
                    r: 0.7
                },
                stops: [
                    [0, color],
                    [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
                ]
            };
        });
        
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }


        $(document).ready(function () {
            $('body').layout({ applyDefaultStyles: true, size: "auto" });

            
            //var centerid = "001";
            var centerid = getParameterByName("cid");
            $(".rcorners").click(function () {
                $('p').removeClass('active');
                $(this).addClass('active');
            });


           
            //Get Leader Board Information
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Services/CCTService.asmx/GetLeaderBoardDetails",
                data: "{ strCenterID : '" + centerid + "'}",
                dataType: "json",
                success: function (Result) {
                    for (var i = 0; i < Result.d.length; i++) {
                        var iTemp = i;
                        $("#ldrboarddiv").append("<div style='clear:both; width: 100%'><div style='float: left; width: 30%'><a href='AgentView.aspx?cid=" + centerid + "&aid=" + Result.d[i].Id + "'><img style='padding-left: 10px' src='Content/Images/Agent" + parseInt(parseInt(iTemp) + 1) + ".jpg' class='curvedimage' /></a></div><div style='float: left; color:white; width: 70%; margin-top: 10px; line-height: 26px'><b>Agent Name: </b>" + Result.d[i].Name + "<br /><b>Score: </b>" + Result.d[i].TotalPoints + " pts<br /><b>Rank: </b>" + Result.d[i].Rank + "</div></div>");

                        //$("#Table1").append("<tr><td class='left-align font-bold'>" + data.d[i].Make + "</td><td class='left-align font-bold'>" + data.d[i].Model + "</td><td class='left-align font-bold'>" + data.d[i].Year + "</td><td class='right-align font-bold'>" + data.d[i].Doors + "</td><td class='right-align font-bold'>" + data.d[i].Colour + "</td><td class='right-align font-bold'>" + data.d[i].Price + "</td></tr>");
                    }
                   
                },
                error: function (Result) {
                    alert("Error");
                }
            });




            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Services/CCTService.asmx/GetSupervisorInfo",
                data: "{ strCenterID : '" + centerid + "'}",
                dataType: "json",
                success: function (Result) {
                    //alert(Result.d.UserName);
                    //alert(Result.d.UserValue);
                    //Result = Result.d;
                    //var data = [];
                    //for (var i in Result) {
                    //    var serie = new Array(Result[i].Name, Result[i].Value);
                    //    data.push(serie);
                    //}
                    var tblval = "<table class='features-table'><thead><tr><td>Sup Name</td><td>Score</td><td>Top KPIs</td><td>Bottom KPIs</td></tr></thead><tfoot><tr><td></td><td></td><td></td><td></td></tr></tfoot><tbody>";
                    for (var ctr = 0; ctr < Result.d.UserName.length; ctr++)
                    {
                        tblval += "<tr><td>" + Result.d.UserName[ctr] + "</td><td>" + Result.d.UserScore[ctr] + "</td><td class='replaceme'>" + Result.d.TopKPIs[ctr].replace(';', ';<br/>') + "</td><td class='replaceme'>" + Result.d.BottomKPIs[ctr].replace(';', ';<br/>') + "</td></tr>";
                    }
                    tblval += "</tbody></table>";
                    $('#mainn').append(tblval);

                    //$('.replaceme').html('Whatever <b>HTML</b> you want here.');

                    $('#divCenter').html(Result.d.HeaderName);
                    //DreawChart(data);
                    var seriesName = new Array();
                    var seriesScore = new Array();
                    var seriesTopKPI = new Array();
                    var seriesBottomKPI = new Array();
                    var seriesAgentID = new Array();

                    seriesName = Result.d.UserName;//.split(',');
                    seriesTopKPI = Result.d.TopKPIs;
                    seriesBottomKPI = Result.d.BottomKPIs;
                    seriesAgentID = Result.d.AgentID;
                    //for (var i = 0; i < seriesOne.length; i++) {
                    //    seriesOne[i] = parseInt(seriesOne[i]);
                    //}

                    seriesScore = Result.d.UserScore;//.split(',');
                    DreawChart(seriesName, seriesScore, seriesTopKPI, seriesBottomKPI, seriesAgentID, centerid);
                },
                error: function (Result) {
                    alert("Error");
                }
            });

        });

        function DreawChart(uname, uvalue, utopkpi, ubottomkpi, agentids,cid) {
            var arr = []
            $.map(uvalue, function (item, index) {
                arr.push(parseInt(item));
            });


            $('#container').highcharts({
                chart: {
                    type: 'column'
                },
                colors: ['#50B432'],
                title: {
                    text: 'Supervisors'
                },
                xAxis: {
                    categories: uname,
                    labels: {
                        style: {
                            cursor: 'pointer',
                            fontSize: '14px'
                        },
                        events: {
                            click: function (e) {
                                window.location.href = "SupView.aspx?cid=" + cid + "&sid=" + agentids[jQuery.inArray(this.value, uname)];
                                //alert(agentids[jQuery.inArray(this.value, uname)]);
                                //console.log(e.xAxis[0].value);
                                //alert(e.xAxis[0].value);
                                //ajax post
                            }
                        }
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Points (in %)'
                    }
                    //,
                    //stackLabels: {
                    //    enabled: false,
                    //    style: {
                    //        fontWeight: 'bold',
                    //        color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                    //    }
                    //}
                },

                tooltip: {
                    shared: true,
                    formatter: function () {
                        var ind = uname.indexOf(this.x);
                        var s;
                        s = "<b>Name: </b>" + uname[ind] + "<br/><b>Score: </b>" + uvalue[ind] + "%<br/><b>Top KPIs: </b>" + utopkpi[ind] + "<br/><b>Bottom KPIs: </b>" + ubottomkpi[ind];
                        //$.each(this.points, function (i, point) {
                        //    //s += point.series.options.composition[ind];

                        //    s = "<b>Name: </b>" + point.x + "<br/><b>Score: </b>" + point.y + "%<br/><b>Top KPIs: </b>" + utopkpi[ind] + "<br/><b>Bottom KPIs: </b>" + ubottomkpi[ind];
                        //});
                        return s;
                    }
                    //headerFormat: '<b>{point.x}</b><br/>',
                    //pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
                },
                //plotOptions: {
                //    column: {
                //        stacking: 'percent',
                //        dataLabels: {
                //            enabled: true,
                //            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                //            style: {
                //                textShadow: '0 0 3px black'
                //            }
                //        }
                //    }
                //},
                plotOptions: {
                    series: {
                        borderWidth: 0,
                        dataLabels: {
                            enabled: true,
                            format: '{point.y:.1f}%'
                        }
                    }
                },
                series: [{
                    showInLegend: false,
                    name: 'Supervisors',
                    data: arr
                    //,
                    //dataLabels: {
                    //    enabled: true,
                    //    y: -14,
                    //    formatter: function () {
                    //        var indformat = uname.indexOf(this.x);
                    //        var otherY = this.series.chart.series[0].yData[this.point.x];
                    //        if (this.y >= otherY) {
                    //            return '<div style="padding-top: 10px">Top KPI: ' + utopkpi[indformat] + '<br/>Bottom KPI: ' + ubottomkpi[indformat] + "</div>";
                    //        } else {
                    //            return null;
                    //        }
                    //    }
                    //}
                }
                ]

            }//);
            , function (chart) {

                var bottom = chart.plotHeight - 20;

                $.each(chart.series[0].data, function (i, data) {
                    if (data.y > 50) {
                        data.update({
                            color: '#50B432'
                        });
                    }
                    else {
                        data.update({
                            color: '#ff8a45'
                        });
                    }
                });

            });
        }


        $('.highcharts-xaxis-labels text').on('click', function () {
            console.log($(this).text());
            alert($(this).text());
        });


    </script>
    <style type="text/css">
        .active {
            border-style: solid;
            border-width: 2px;
            border-color: red;
        }
        body
        {
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
            color:black;
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

        /*#upright {
            width: 40%;
            height: 100%;
            float: left;
        }*/

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
            border-top-right-radius:50% 10%;
            border-top-left-radius:50% 10%;
            border-bottom-right-radius:50% 10%;
            border-bottom-left-radius:50% 10%;
            width: 130px;
            height:130px;
        }

       .ui-layout-resizer-east
       {
           right : 40% !important;
       }

    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div class="ui-layout-center leftpane">
        <div id="upleft">
            <div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
            <div id="mainn" style="width:70%; padding-top: 50px;"></div>
        </div>

    </div>
    <div class="ui-layout-north topheader">
        Cozy 3.0 - Call Center Workforce Optimization
        <div style="float:right; color: yellow" id="divCenter"></div>
        <div style="float:right">Center Name: &nbsp;&nbsp; </div>
    </div>
    
    <div class="ui-layout-east rightpane" style="background-color: #363636; width : 39% !important;">
        <div style="background-color: #3bbfaf; color: white; margin-top:-25px; width:100%">
            <h2 style="vertical-align: middle">Leader Board</h2>
        </div>

        <div id="ldrboarddiv">
        </div>
    </div>

    </form>
</body>
</html>