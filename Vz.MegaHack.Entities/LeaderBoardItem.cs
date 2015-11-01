using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vz.MegaHack.Entities {

    public class LeaderBoardItem {
        public string Id { get; set; }
        public string Name { get; set;  }
        public int TotalPoints { get; set; }
        public int Rank { get; set; }
        public string PhotoFileName { get; set; }

        public override string ToString() {
            return string.Format("Rank:{0}, Id:{1}, Name:{2}, Points={3}, PhotoPath={4}", Rank, Id, Name, TotalPoints, PhotoFileName);
        }
    }
}
