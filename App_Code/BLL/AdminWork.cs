using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL;
using System.Data.SqlClient;
using System.Data;
using VariablesRefrence;
using System.Net;
using System.Net.Mail;

namespace BLL
{
    public class AdminWork
    {
        static int value;
        public static int AddRoom(int RoomNo,string RoomType, string img, Double BookingChargr, Double CancellationCharge, string createby)
        {
            try
            {
                string sp_name = "AddRooms";
                SqlParameter[] param = new SqlParameter[7];
                param[1] = new SqlParameter("@RoomNo", RoomNo);
                param[2] = new SqlParameter("@RoomType", RoomType);
                param[3] = new SqlParameter("@RoomImage", img);
                param[4] = new SqlParameter("@BookingRate", BookingChargr);
                param[5] = new SqlParameter("@CancellationRate", CancellationCharge);
                param[6] = new SqlParameter("@CreateBy", createby);
                

                value = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.ConnectionString(),CommandType.StoredProcedure,sp_name,param));
            }
            catch (Exception e)
             {
                 throw e;
            }
            return value;
        }


        public static DataSet ApprovedRoomBooking(int RoomId, string result)
        {
            try
            {
                string sp_name = "ApproveRoomBooking";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@BookId", RoomId);
                param[1] = new SqlParameter("@result", result);
                DataSet dar = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param);
                return dar;
            }
            catch (Exception e)
            {
                throw e;
            }

        }

        public static DataSet ApprovedUserAdminRequest(int RoomId, string result,string AppBy)
        {
            try
            {
                string sp_name = "updateUserAdminRequest";
                SqlParameter[] param = new SqlParameter[3];
                param[0] = new SqlParameter("@UesrId", RoomId);
                param[1] = new SqlParameter("@value", result);
                param[2] = new SqlParameter("@AppBy", AppBy);
                DataSet value = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param);
                return value;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static int DeleteUser(int userId)
        {
            try 
            {
                string sp_name = "DeleteUser";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@UserId", userId);

                int value = Convert.ToInt32(SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param));
                return value;
            }
            catch (Exception e) { throw e; }
            
        }



        public static int AddDocumentType(string DocName, int Docmax, int DocMin, int createBy)
        {
            string sp_name = "ForAddDocumentType";
            try
            {
                SqlParameter[] param = new SqlParameter[4];
                param[0] = new SqlParameter("@DocName", DocName);
                param[1] = new SqlParameter("@DocMaxLength", Docmax);
                param[2] = new SqlParameter("@DocMinLength", DocMin);
                param[3] = new SqlParameter("@CreateBy", createBy);

                int value = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param));
                return value;
            }
            catch { throw; }
        }


        public static int updateuserDetails(FroUserUpdation Fr)
        {
            try
            {
                string sp_name = "UpdateUserDetails";
                SqlParameter[] param = new SqlParameter[12];
                param[0] = new SqlParameter("@userId", Fr.userId);
                param[1] = new SqlParameter("@firstname", Fr.firstname);
                param[2] = new SqlParameter("@lastname", Fr.Lastname);
                param[3] = new SqlParameter("@MobileNo", Fr.MobileNo);
                param[4] = new SqlParameter("@Email_Id", Fr.EmailId);
                param[5] = new SqlParameter("@Address", Fr.Address);
                param[6] = new SqlParameter("@UserName", Fr.userName);
                param[7] = new SqlParameter("@Document_Type", Fr.DocumentType);
                param[8] = new SqlParameter("@Document_No", Fr.DocumentNo);
                param[9] = new SqlParameter("@DocumentImage", Fr.Document_Image);
                param[10] = new SqlParameter("@isActive", Fr.IsActive);
                param[11] = new SqlParameter("@ModifyBy", Fr.updateby);


                int value = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param));
                return value;




            }
            catch
            {
                throw;
            }
        }


        public static void sendMail(string ToMail, string subject, string Body)
        {
            using (MailMessage mm = new MailMessage("rajan975390@gmail.com", ToMail))
            {
                mm.Subject = subject;
                mm.Body = Body;

                mm.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential("rajan975390@gmail.com", "ycoqodpfdmhpmjlg");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
            }

        }

        public static int softDeleteRooms(int RoomId,String DeleteBy)
        {
            try
            {
                string sp_name = "SoftDeleteAddRoom";

                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@RoomId", RoomId);
                param[1] = new SqlParameter("@DeleteBy", DeleteBy);

                int value = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param));
                return value;
            }
            catch { throw; }
        }


        public static int UpdateAddRoom(int RoomId,int RoomNo, string RoomType, double Booking, double Cancel, string images, string ModifyBy,bool Active)
        {
            try
            {
                string sp_name = "UpDateAddRoom";
                SqlParameter[] param = new SqlParameter[8];
                param[0] = new SqlParameter("@RoomId", RoomId);
                param[1] = new SqlParameter("@RoomNo", RoomNo);
                param[2] = new SqlParameter("@RoomType", RoomType);
                param[3] = new SqlParameter("@BookingRate", Booking);
                param[4] = new SqlParameter("@CancelCharge", Cancel);
                param[5] = new SqlParameter("@RoomImage", images);
                param[6] = new SqlParameter("@ModifyBy", ModifyBy);
                param[7] = new SqlParameter("@IsActive", Active);

                int value = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param));
                return value;
            }
            catch { throw; }
        }

        public static int updateDocType(int resultset, int id, string Docname, int max, int min, int modby, bool active )
        {
            try
            {
                string sp_name = "updateDocumentType";
                SqlParameter[] param = new SqlParameter[7];
                param[0] = new SqlParameter("@resutlset", resultset);
                param[1] = new SqlParameter("@DocId", id);
                param[2] = new SqlParameter("@DocName", Docname);
                param[3] = new SqlParameter("@DocMaxLength", max);
                param[4] = new SqlParameter("@DocMinLength", min);
                param[5] = new SqlParameter("@ModifyBy", modby);
                param[6] = new SqlParameter("@IsActive", active);


                int value = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param));
                return value;

            }
            catch
            {
                throw;
            }
        }


        public static int UpdateRoomTypeDetails(int id,int resultset, string RoomType,string modBy, bool checkvalue)
        {
            try
            {
                string sp_name = "ForRoomType";
                SqlParameter[] param = new SqlParameter[5];
                param[0] = new SqlParameter("@id",id);
                param[1] = new SqlParameter("@resultset", resultset);
                param[2] = new SqlParameter("@RoomType", RoomType);
                param[3] = new SqlParameter("@createBy", modBy);
                param[4] = new SqlParameter("@IsActive", checkvalue);

                int value = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param));
                return value;

            }
            catch { throw; }
        }


        public static DataSet PerformUserType(int TypeId, string UserType, bool IsActive, string CreateBy, int InsertType)
        {
            try
            {
                string sp_name = "ForUserType";
                SqlParameter[] param = new SqlParameter[5];
                param[0] = new SqlParameter("@TypeId", TypeId);
                param[1] = new SqlParameter("@UserType", UserType);
                param[2] = new SqlParameter("@IsActive", IsActive);
                param[3] = new SqlParameter("@CreateBy", CreateBy);
                param[4] = new SqlParameter("@InsertType", InsertType);
                DataSet dat = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString(), sp_name, param);
                return dat;
            }
            catch
            {
                throw;
            }
        }
    }
}