using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL;
using VariablesRefrence;
using System.Data.SqlClient;
using System.Data;


namespace BLL
{
    public class UserWork
    {
        static int value;
       
        public static int BookRoomRequest(BookRequestVariable Br)
        {
            try
            {
                string sp_name = "BookRequestForRoom";
                SqlParameter[] param = new SqlParameter[7];
                param[0] = new SqlParameter("@RoomId", Br.RoomId);
                param[1] = new SqlParameter("@UserId", Br.UserId);
                param[2] = new SqlParameter("@FromDate", Br.FromDate);
                param[3] = new SqlParameter("@ToDate", Br.ToDate);
                param[4] = new SqlParameter("@UserRemark", Br.UserRemark);
                param[5] = new SqlParameter("@CreateBy", Br.createBy);
                param[6] = new SqlParameter("@BookingPrice", Br.Bookprice);

                value = Convert.ToInt32(SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionString(), sp_name, param));
                
            }
            catch (Exception e)
            {
                throw e;
            }
            return value;

        }

        public static double CalculateDate(string date1, string date2)
        {
            double value;
            DateTime dateone = Convert.ToDateTime(date1);
            DateTime datetwo = Convert.ToDateTime(date2);
            try
            {
                if (dateone >= DateTime.Now)
                {
                    TimeSpan Cal = datetwo - dateone;
                    double calConvert = Cal.Days;
                    int val = (int)calConvert;
                    if (val < 0)
                        value = -1;
                    else if (val == 0)
                        value = 1;
                    else
                        value = val;

                }
                else
                    value = 0;

            }
            catch (Exception e)
            {
                throw e;
            }
            return value;
        }

        public static DataSet getValueofDate(int RoomId)
        {
            DataSet Dat = new DataSet();
            string sp_name = "getAllDatesForValidation";
            

            try
            {
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@RoomId", RoomId);

                Dat = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param);
                return Dat;
            }
            catch
            {
                throw;
            }
        }
        static List<string> containDate = new List<string>();
        public static List<string> CheckDateAlreadyExists(int initial, int roomId)
        {

            DataSet dat = getValueofDate(roomId);
            DataTable dt = new DataTable();
            dt = dat.Tables[0];

            if (dt.Rows.Count > initial)
            {
                DateTime D1 = DateTime.Parse(dt.Rows[initial]["FromDate"].ToString()).Date;
                DateTime D2 = DateTime.Parse(dt.Rows[initial]["ToDate"].ToString()).Date;
                while (D1 <= D2)
                {
                    containDate.Add(D1.ToShortDateString());
                    D1 = D1.AddDays(1);
                }
                CheckDateAlreadyExists(initial + 1, roomId);
            }
            return containDate;
        }

        public static string ChangeDate(string date)
        {
           string MainValue = "";
           if (date != "")
            {
                string one = date.Substring(0, 2);
                string two = date.Substring(3, 2);
                string three = date.Substring(6, 4); 

                MainValue = $"{one}-{two}-{three}";
                
            }
            return MainValue;

        }

    }
}