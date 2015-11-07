<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailView.aspx.cs" Inherits="Vz.MegaHack.Web.DetailView" %>
<!DOCTYPE html>

<html class="js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">
<head runat="server">
    <title>Cozy 3.0 - Call Center Workforce Optimization</title>
    
</head>
<body>
    <form id="form1" runat="server">
         <div class="ui-layout-center leftpane">
        <div id="upleft">
            <div style="float: left; margin-top: -21px;">
                <h3>Heat Map View</h3>
            </div>
            <div style="float: right">
                <a style="cursor:pointer; color: darkblue; text-decoration-line: underline" onclick="goback()">Back</a>
            </div>
                <div id="divOutput" style="margin-top: -37px;"></div>
                <%--<table id="tableOutput2" class="table table-header-rotated" style="margin: 57px auto 0px auto;">
                    <thead>
                    <tr>
                        <th></th>
                        <th>Behaviour Attribute</th>
                        <th class="rotate"><div><span>Center Avg</span></div></th>
                        <th class="rotate"><div><span><a onclick="Navigate2Agent(1)">Agent 1</a></span></div></th>
                        <th class="rotate"><div><span>Agent 2</span></div></th>
                        <th class="rotate"><div><span>Agent 3</span></div></th>
                        <th class="rotate"><div><span>Agent 4</span></div></th>
                        <th class="rotate"><div><span>Agent 5</span></div></th>
                        <th class="rotate"><div><span>Agent 6</span></div></th>
                        <th class="rotate"><div><span>Agent 7</span></div></th>
                        <th class="rotate"><div><span>Agent 8</span></div></th>
                        <th class="rotate"><div><span>Agent 9</span></div></th>
                        <th class="rotate"><div><span>Agent 10</span></div></th>
                    </tr>
                        </thead>
                    <tbody>
                        <tr class="attr" data-sd="171">
                            <th class="row-header" rowspan="5">Call Attributes</th>
                            <th class="row-header">Total Calls</th>
                            <td class="avg">645</td>
                            <td class="val">775</td>
                            <td class="val">456</td>
                            <td class="val">436</td>
                            <td class="val">345</td>
                            <td class="val">688</td>
                            <td class="val">644</td>
                            <td class="val">700</td>
                            <td class="val">533</td>
                            <td class="val">634</td>
                            <td class="val">235</td>
                        </tr>
                         <tr class="attr" data-sd="7.41">
                            <th class="row-header">Hold Duration > 3 mins</th>
                            <td class="avg">16.7</td>
                            <td class="val">11.2</td>
                            <td class="val">18.4</td>
                            <td class="val">15</td>
                            <td class="val">16</td>
                            <td class="val">14</td>
                            <td class="val">16.4</td>
                            <td class="val">11</td>
                            <td class="val">16</td>
                            <td class="val">17</td>
                            <td class="val">18</td>
                        </tr>
                         <tr class="attr" data-sd="0.20">
                            <th class="row-header">ACS Rating < 5</th>
                            <td class="avg">0.3</td>
                            <td class="val">0.1</td>
                            <td class="val">0.2</td>
                            <td class="val">0.6</td>
                            <td class="val">0.0</td>
                            <td class="val">0.3</td>
                            <td class="val">0.2</td>
                            <td class="val">0.1</td>
                            <td class="val">0.7</td>
                            <td class="val">0.4</td>
                            <td class="val">0.3</td>
                        </tr>
                         <tr class="attr" data-sd="7.3">
                            <th class="row-header">Silent Time > 3 mins</th>
                            <td class="avg">20.0</td>
                            <td class="val">10.4</td>
                            <td class="val">11.2</td>
                            <td class="val">12.2</td>
                            <td class="val">14.5</td>
                            <td class="val">16.4</td>
                            <td class="val">18.9</td>
                            <td class="val">19.5</td>
                            <td class="val">22.3</td>
                            <td class="val">9.5</td>
                            <td class="val">17.4</td>
                        </tr>
                         <tr class="attr" data-sd="9.63">
                            <th class="row-header">Cross talk time > 0 mins</th>
                            <td class="avg">23.1</td>
                            <td class="val">33.1</td>
                            <td class="val">24.9</td>
                            <td class="val">4.5</td>
                            <td class="val">34.7</td>
                            <td class="val">23.4</td>
                            <td class="val">26.7</td>
                            <td class="val">32.7</td>
                            <td class="val">27.5</td>
                            <td class="val">1.9</td>
                            <td class="val">22.3</td>
                        </tr>
                         
                        <tr class="attr" data-sd="0.92">
                            <th rowspan="2" class="row-header">Speech Analytics</th>
                            <th class="row-header">Escated to Supervisor</th>
                            <td class="avg">0.4</td>
                            <td class="val">0.3</td>
                            <td class="val">1.4</td>
                            <td class="val">0.4</td>
                            <td class="val">0.3</td>
                            <td class="val">0.1</td>
                            <td class="val">1.9</td>
                            <td class="val">0.5</td>
                            <td class="val">0.4</td>
                            <td class="val">0.3</td>
                            <td class="val">0.6</td>
                        </tr>
                        <tr class="attr" data-sd="0.69">
                            <th class="row-header">Negative Attitude</th>
                            <td class="avg">1.0</td>
                            <td class="val">0.5</td>
                            <td class="val">2.9</td>
                            <td class="val">0.4</td>
                            <td class="val">0.9</td>
                            <td class="val">1.7</td>
                            <td class="val">0.3</td>
                            <td class="val">0.9</td>
                            <td class="val">1.0</td>
                            <td class="val">0.3</td>
                            <td class="val">0.7</td>
                        </tr>
                        <tr class="attr" data-sd="6.9">
                            <th class="row-header">Metrics</th>
                            <th class="row-header">FiOS TV Close Rate</th>
                            <td class="avg">17</td>
                            <td class="val">11.2</td>
                            <td class="val">18.4</td>
                            <td class="val">1.5</td>
                            <td class="val">18.5</td>
                            <td class="val">11.8</td>
                            <td class="val">0.5</td>
                            <td class="val">22.4</td>
                            <td class="val">5.8</td>
                            <td class="val">19.4</td>
                            <td class="val">7.5</td>
                        </tr>
                    </tbody>
                </table>--%>
            
        </div>

        
    </div>
    <div class="ui-layout-north topheader"><a href="CenterView.aspx?cid=001" style="text-decoration: none; color: white">Cozy 3.0 - Call Center Workforce Optimization</a>
        <div style="float:right; color: yellow" id="divSupName"></div>
        <div style="float:right">Supervisor Name: &nbsp;&nbsp; </div>
    </div>
    
    

    </form>
</body>
</html>


<script src="Content/Scripts/Libs/jquery-1.10.2.min.js"></script>
    
    <script src="Content/Scripts/Libs/jquery.layout.js"></script>
    
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

        }



        #upleft {
            width: 99%;
            height: 100%;
            float: left;
            /*border-style: solid;
            border-width: 1px;
            border-right: solid;
            border-right-color: gray;*/
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


       .ui-layout-resizer-east
       {
           right : 40% !important;
       }

       .table-header-rotated {
            border-collapse: collapse;
        }

        .csstransforms .table-header-rotated td {
            width: 30px;
        }

        .no-csstransforms .table-header-rotated th {
            padding: 5px 10px;
        }

        .table-header-rotated td {
            text-align: center;
            padding: 10px 5px;
            border: 1px solid #ccc;
        }

        .csstransforms .table-header-rotated th.rotate {
            height: 140px;
            white-space: nowrap;
        }

            .csstransforms .table-header-rotated th.rotate > div {
                -webkit-transform: translate(33px, 51px) rotate(315deg);
                -ms-transform: translate(33px, 51px) rotate(315deg);
                transform: translate(33px, 51px) rotate(315deg);
                width: 30px;
            }

                .csstransforms .table-header-rotated th.rotate > div > span {
                    border-bottom: 1px solid #ccc;
                    padding: 5px 10px;
                }

        .table-header-rotated th.row-header {
            padding: 0 10px;
            border-bottom: 1px solid #ccc;
            border-left: 1px solid #ccc;
        }
        </style>
<link href="Content/Styles/jquery-ui.min.css" rel="stylesheet" />
<link href="Content/Styles/jquery-ui-slider-pips.css" rel="stylesheet" />
        <style>
        /* End*/

        .ui-state-hover, .ui-state-focus {
            border: 0px;
        }


    </style>
    <script src="Content/Scripts/Libs/jquery-ui.js"></script>
    <script src="Content/Scripts/Libs/jquery-ui-slider-pips.js"></script>
    <script type="text/javascript">
        function Navigate2Agent(agentid) {
            window.location.href = "AgentView.aspx?cid=" + getParameterByName('cid') + "&aid=" + agentid + "&sid=" + getParameterByName('sid');
        }

        var timeoutVar = null;
        
        function outputUpdate(vol) {
            document.querySelector('#tolerenceOutput').value = vol;
            clearTimeout(timeoutVar);
            timeoutVar = setTimeout(function () {
                recalculateWithSD(vol);
            }, 100);
        }


        function rgb(p, color) {
            if (color == 'r') {
                r = 255;
                g = (1 - p) * 255;
            } else {
                g = 255;
                r = (1 - p) * 255;
            }

            b = (1 - p) * 255;
            return 'rgb(' + Math.round(r) + ',' + Math.round(g) + ',' + Math.round(b) + ')';
        }

        function recalculateWithSD(min, max) {
            var $rows = $("#tableOutput .attr");
            $rows.each(function () {
                var $row = $(this);
                var avg = parseFloat($row.find("td.avg").text());
                var sd = parseFloat($row.attr("data-sd")).toFixed(2);
                var mode = $row.attr("data-mode");
                console.log(mode);
                $row.children("td.val").each(function () {
                    var v = parseFloat($(this).text());
                    var zscore = (v - avg) / sd;
                    if (zscore > min && zscore < max) {
                        //console.log("zscore=" + zscore);
                        if (mode == "n") {
                            if (zscore <= 0) {
                                $(this).css("background", rgb(((-1) * zscore / 3), "r"));
                            } else {
                                $(this).css("background", rgb((zscore / 3), "g"));
                            }
                        }
                        else {
                            if (zscore <= 0) {
                                $(this).css("background", rgb(((-1) * zscore / 3), "g"));
                            } else {
                                $(this).css("background", rgb((zscore / 3), "r"));
                            }
                        }
                    } else {
                        $(this).css("background-color", "#000");
                    }
                    if (min > 0) {
                        //$(this).css("background",rgb(zscore * threshold));
                    } else {
                        //$(this).css("background","white");
                    }
                });

            });
        }

        function recalculate(threshold) {
            var $rows = $("#tableOutput .attr");
            $rows.each(function () {
                var $row = $(this);
                var avg = parseInt($row.find("td.avg").text());
                $row.children("td.val").each(function () {
                    var v = parseInt($(this).text());
                    var per = 0;
                    if (v > avg) {
                        per = ((v - avg) * 100) / avg
                        console.log(per);
                    }
                    if (threshold > 0 && per >= threshold) {
                        $(this).css("background", "red")
                    } else {
                        $(this).css("background", "white")
                    }
                });

            });
        }



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
            var supid = getParameterByName('sid');

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Services/CCTService.asmx/GetHeatMapDetails",
                data: "{ strSupID : '" + supid + "'}",
                dataType: "json",
                success: function (Result) {
                    //alert(Result.d.UserName);
                    //alert(Result.d.UserValue);
                    //Result = Result.d;
                    $('#divSupName').html(Result.d.SupervisorName);
                    var tblVal = "";
                    //Table Tag
                    //$('#divOutput').append("<table id='tableOutput' class='table table-header-rotated' style='margin: 57px auto 0px auto;'><thead><tr><th></th><th>Behaviour Attribute</th>");
                    tblVal = "<table id='tableOutput' class='table table-header-rotated' style='margin: 57px auto 0px auto;'><thead><tr><th></th><th style='border-bottom: thin; border-bottom-color: #ccc; border-bottom-style: solid; vertical-align: bottom'>Behaviour Attribute</th>";
                    //Table Header
                    for (var i in Result.d.HeatMapView[1]) {
                        if ((i == ".Standard Deviation") || (i == ".Behavior Attribute") || (i == "..Category") || (i == ".Mode")) {
                            continue;
                        }
                        else if (i == ".Center Average")
                        {
                            tblVal += "<th class='rotate'><div><span>Center Average</span></div></th>";
                        }
                        else
                        {
                            tblVal += "<th class='rotate'><div><span><a style='cursor:pointer' onclick='Navigate2Agent(\"" + Result.d.HeatMapView[0][i] + "\")'>" + i + "</a></span></div></th>";
                        }
                        
                    }

                    //$('#divOutput').append("</tr></thead><tbody>");
                    tblVal += "</tr></thead><tbody>";
                    //Table Body
                    //var hmlength = Object.keys(Result.d.HeatMapView[0]).length;
                    var hmlength = Result.d.HeatMapView.length;
                    var callAttr = "";
                    for (var ctr = 1; ctr < hmlength; ctr++) {
                        //$('#divOutput').append("<tr class='attr' data-sd='" + Result.d.HeatMapView[ctr]['.Standard Deviation'] + "'>");
                        tblVal += "<tr class='attr' data-mode='" + Result.d.HeatMapView[ctr]['.Mode'] + "' data-sd='" + Result.d.HeatMapView[ctr]['.Standard Deviation'] + "'>";
                        if (callAttr != Result.d.HeatMapView[ctr]['..Category']) {
                            if (Result.d.HeatMapView[ctr]['..Category'] == "Call Attributes") {
                                //$('#divOutput').append("<th class='row-header' rowspan='7'>Call Attributes</th>");
                                tblVal += "<th class='row-header' rowspan='7' style='border-top: thin; border-top-color: #ccc; border-top-style: solid'>Call Attributes</th>";
                            }
                            else if (Result.d.HeatMapView[ctr]['..Category'] == "Speech Analytics") {
                                //$('#divOutput').append("<th class='row-header' rowspan='2'>Speech Analytics</th>");
                                tblVal += "<th class='row-header' rowspan='2'>Speech Analytics</th>";
                            }
                            else if (Result.d.HeatMapView[ctr]['..Category'] == "Metrics") {
                                //$('#divOutput').append("<th class='row-header' rowspan='9'>Metrics</th>");
                                tblVal += "<th class='row-header' rowspan='9'>Metrics</th>";
                            }
                        }

                        for (var i in Result.d.HeatMapView[ctr]) {
                            //Ignore columns
                            if ((i == ".Standard Deviation") || (i == "..Category") || (i == ".Mode")) {
                                continue;
                            }
                            else if (i == ".Behavior Attribute") {
                                //$('#divOutput').append("<th class='row-header'>" + Result.d.HeatMapView[ctr][i] + "</th>");
                                tblVal += "<th class='row-header'>" + Result.d.HeatMapView[ctr][i] + "</th>";
                            }
                            else if (i == ".Center Average") {
                                //$('#divOutput').append("<td class='avg'>" + Result.d.HeatMapView[ctr][i] + "</td>");
                                tblVal += "<td class='avg'>" + Result.d.HeatMapView[ctr][i] + "</td>";
                            }
                            else {
                                //$('#divOutput').append("<td class='val'>" + Result.d.HeatMapView[ctr][i] + "</td>");
                                tblVal += "<td class='val'>" + Result.d.HeatMapView[ctr][i] + "</td>";
                            }

                        }

                        callAttr = Result.d.HeatMapView[ctr]['..Category'];

                        //$('#divOutput').append("</tr>");
                        tblVal += "</tr>";
                    }

                    //$('#divOutput').append("</tbody></table>");
                    tblVal += "</tbody></table>";
                    $('#divOutput').append(tblVal);
                    //var str = $('#divOutput').html();
                    setTimeout(function () {
                        recalculateWithSD(-3, 3);
                    }, 200);
                },
                error: function (Result) {
                    alert("Error");
                }
            });



        });

    </script>

