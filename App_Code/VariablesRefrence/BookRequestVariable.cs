using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VariablesRefrence
{
    public class BookRequestVariable
    {
        public int RoomId { get; set; }
        public int UserId { get; set; }
        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }
        public string UserRemark { get; set; }
        public string createBy { get; set; }
        public string RoomType { get; set; }
        public string Bookprice { get; set; }

        public string UserName { get; set; }
    }
}