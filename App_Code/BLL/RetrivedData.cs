using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL;
using System.Data.SqlClient;
using System.Data;

namespace BLL
{
    public class RetrivedData
    {
       public static DataSet getRoomsForHoteInterFace()
        {
            try
            {
                DataSet dt;
                string sp_name = "ShowAddedRoom";
                dt = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name);
                return dt;
            }
            catch
            {
                throw;
            }
            
        }

        public static SqlDataReader getRoomForHotelRoomBookingPage(int RoomID)
        {
            try
            {
                SqlDataReader dt;
                string sp_name = "getRooms";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@RoomId", RoomID);
                dt = SqlHelper.ExecuteReader(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param);
                return dt;
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public static SqlDataReader getRomHistorybyUser(int userId)
        {
            string userType = "user";
           
            try
            {
                SqlDataReader dar;
                string sp_name = "roomBookHistory";
                int FilterValue = 0;

                SqlParameter[] param = new SqlParameter[4];
                param[0] = new SqlParameter("@UserId", userId);
                param[1] = new SqlParameter("@userType", userType);
                param[2] = new SqlParameter("@FillValue", FilterValue);
                param[3] = new SqlParameter("@RoomId", 0);
                
                dar = SqlHelper.ExecuteReader(SqlHelper.ConnectionString(), CommandType.StoredProcedure,sp_name ,param);
                return dar;
            }
            catch
            {
                throw;
            }
            

        }

        public static SqlDataReader getRomHistorybyAdmin(int fillhistory,int RoomNo)
        {
            string userType = "admin";

            try
            {
                SqlDataReader dar;
                string sp_name = "roomBookHistory";
                SqlParameter[] param = new SqlParameter[4];
                param[0] = new SqlParameter("@UserId", 0);
                param[1] = new SqlParameter("@userType", userType);
                param[2] = new SqlParameter("@FillValue", fillhistory);
                param[3] = new SqlParameter("@RoomId", RoomNo);

                dar = SqlHelper.ExecuteReader(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param);
                return dar;
            }
            catch 
            {
                throw ;
            }


        }

        public static DataSet getAllUserDetails(int num)
        {
            DataSet dt;
            try
            {
                string sp_name = "AdminDefaultShowUser";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@fillvalue", num);


                dt = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name,param);
                return dt;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

       public static DataSet GetAllUserRequestDetails(int fillvalue)
        {
            DataSet dt;
            try
            {
                string sp_name = "AdminRequest";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@fillvalue", fillvalue);

                dt = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name,param);
                return dt;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static DataSet GetRoomBookinpendingData(int fillValue)
        {
            DataSet dt;
            try
            {
                string sp_name = "RoomBookingApproval";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@fillValue", fillValue);


                dt = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name,param);
                return dt;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static DataSet DocumentValaidation()
        {
            try 
            {
                string sp_name = "validateDocumentType";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@DocId", 0);


                DataSet dar = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param);
                return dar;
            }
            catch
            {
                throw ;
            }
        }


        public static DataSet GetValidateDocumentNum(int Docid)
        {
            try
            {
                DataSet Dat;
                string sp_name = "ToTestDocLength";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@Docid", Docid);
                Dat = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param);
                return Dat;
            }
            catch
            {
                throw;
            }
        }


        public static DataSet getUSerSingleDataForUpdation(int userId)

        {
            try
            {
                string sp_name = "GetsingleDataForUpdation";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@UserId", userId);


                DataSet dat = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param);
                return dat;
            }
            catch
            {
                throw;
            }
        }

        public static DataSet getDocTypeData(int DocId)
        {
            try
            {
                string sp_name = "ShowAddDocument";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@DocId", DocId);

                DataSet dat = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name,param);
                return dat;
                
            }
            catch { throw; }
        }

        public static DataSet GetRoomTypeData(int Id)
        {
            try
            {
                string sp_name = "ShowAddRoomTypeDate";

                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@Id", Id);

                DataSet dat = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param);
                return dat;


            }
            catch { throw; }
        }

        public static DataSet getAllDataDashBord()
        {
            try
            {
                string sp_name = "ForDateBord";
                DataSet dar = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name);
                return dar;
            }
            catch
            {
                throw;
            }
        }

    }
}