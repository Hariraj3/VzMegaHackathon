﻿using Vz.MegaHack.Core;
using Vz.MegaHack.Entities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Vz.MegaHack.Data
{
    public static class KPIReader {
        static string kpiInfoFile = "KPIInfo.xml";
        static string agentKpiFile = "AgentKPI.xml";

        public static List<KPIInfo> GetKPIInfo() {
            List<KPIInfo> elements = new List<KPIInfo>();

            XDocument doc = XDocument.Load(Path.Combine(PathManager.DataPath, kpiInfoFile));

            var items = doc.Root.Elements("KPI").Where(i => i.Attribute("category").Value.Equals("Metrics")); ;

            foreach (var item in items) {
                elements.Add(new KPIInfo() {
                    KpiId = Convert.ToString(item.Attribute("id").Value),
                    KpiName = Convert.ToString(item.Attribute("name").Value),
                    Mode = Convert.ToString(item.Attribute("mode").Value),
                    Category = Convert.ToString(item.Attribute("category").Value)
                });
            }

            return elements;
        }

        public static List<KPIInfo> GetAllKPIInfo() {
            List<KPIInfo> elements = new List<KPIInfo>();

            XDocument doc = XDocument.Load(Path.Combine(PathManager.DataPath, kpiInfoFile));

            var items = doc.Root.Elements("KPI");

            foreach (var item in items) {
                elements.Add(new KPIInfo() {
                    KpiId = Convert.ToString(item.Attribute("id").Value),
                    KpiName = Convert.ToString(item.Attribute("name").Value),
                    Mode = Convert.ToString(item.Attribute("mode").Value),
                    Category = Convert.ToString(item.Attribute("category").Value)
                });
            }

            return elements;
        }

        public static List<AgentKPIInfo> GetAgentKPI() {
            List<AgentKPIInfo> elements = new List<AgentKPIInfo>();

            XDocument doc = XDocument.Load(Path.Combine(PathManager.DataPath, agentKpiFile));

            var items = doc.Root.Elements("Agent");
            var kpiInfo = GetKPIInfo(); //Returns only Metrics KPIs

            foreach (var item in items) {
                string kpiId = Convert.ToString(item.Attribute("kpiId").Value);
                if (kpiInfo.Exists(k => k.KpiId.Equals(kpiId))) {

                    elements.Add(new AgentKPIInfo() {
                        AgentId = Convert.ToString(item.Attribute("id").Value),
                        KpiId = kpiId,
                        Date = Convert.ToDateTime(item.Attribute("date").Value),
                        KpiValue = Convert.ToInt32(item.Attribute("kpiValue").Value),
                        HadTraining = Convert.ToBoolean(item.Attribute("hadTraining").Value),
                        IsAwarded = Convert.ToBoolean(item.Attribute("isAwarded").Value),
                        Description = Convert.ToString(item.Attribute("description").Value)
                    });
                }
            }

            var latestElements = from e in elements
                                 group e by new { e.AgentId, e.KpiId, e.Date } into g
                                 select g.OrderByDescending(i => i.Date).FirstOrDefault();

            return latestElements.ToList();
            //return elements;
        }

        public static List<AgentKPIInfo> GetAgentKPI2() {
            List<AgentKPIInfo> elements = new List<AgentKPIInfo>();

            XDocument doc = XDocument.Load(Path.Combine(PathManager.DataPath, agentKpiFile));

            var items = doc.Root.Elements("Agent");
            var kpiInfo = GetKPIInfo(); //Returns only Metrics KPIs

            foreach (var item in items) {
                string kpiId = Convert.ToString(item.Attribute("kpiId").Value);
                if (kpiInfo.Exists(k => k.KpiId.Equals(kpiId))) {

                    elements.Add(new AgentKPIInfo() {
                        AgentId = Convert.ToString(item.Attribute("id").Value),
                        KpiId = kpiId,
                        Date = Convert.ToDateTime(item.Attribute("date").Value),
                        KpiValue = Convert.ToInt32(item.Attribute("kpiValue").Value),
                        HadTraining = Convert.ToBoolean(item.Attribute("hadTraining").Value),
                        IsAwarded = Convert.ToBoolean(item.Attribute("isAwarded").Value),
                        Description = Convert.ToString(item.Attribute("description").Value)
                    });
                }
            }

            return elements;
        }

        public static List<AgentKPIInfo> GetAgentAllKPI() {
            List<AgentKPIInfo> elements = new List<AgentKPIInfo>();

            XDocument doc = XDocument.Load(Path.Combine(PathManager.DataPath, agentKpiFile));

            var items = doc.Root.Elements("Agent");

            foreach (var item in items) {
                elements.Add(new AgentKPIInfo() {
                    AgentId = Convert.ToString(item.Attribute("id").Value),
                    KpiId = Convert.ToString(item.Attribute("kpiId").Value),
                    Date = Convert.ToDateTime(item.Attribute("date").Value),
                    KpiValue = Convert.ToInt32(item.Attribute("kpiValue").Value),
                    HadTraining = Convert.ToBoolean(item.Attribute("hadTraining").Value),
                    IsAwarded = Convert.ToBoolean(item.Attribute("isAwarded").Value),
                    Description = Convert.ToString(item.Attribute("description").Value)
                });
            }

            return elements;
        }

    }
}
