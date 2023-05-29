using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using VariablesRefrence;
using DAL;

namespace BLL
{
    public class LoginLogic
    {
        int value;
        public LoginLogic()
        {
            //Construction for using
        }

        public int UserRegister(RegisterUserVariables va)
        {
            try
            {
                string sp_name = "UserRegister";
                SqlParameter[] param = new SqlParameter[12];
                param[0] = new SqlParameter("@Firstname", va.FirstName);
                param[1] = new SqlParameter("@LastName", va.LastName);
                param[2] = new SqlParameter("@Mobile_No", va.Mobile_No);
                param[3] = new SqlParameter("@Email_Id", va.Email_Id);
                param[4] = new SqlParameter("@Address", va.Address);
                param[5] = new SqlParameter("@UserName", va.UserName);
                param[6] = new SqlParameter("@Password", va.Password);
                param[7] = new SqlParameter("@Document_Type", va.Document_Type);
                param[8] = new SqlParameter("@Document_No", va.Document_Number);
                param[9] = new SqlParameter("@Document_Image", va.Document_Image);
                param[10] = new SqlParameter("@Admin_Request", va.AdminRequest);
                param[11] = new SqlParameter("@CreateBy", va.UserId);

                value = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.ConnectionString(), sp_name, param));
            }
            catch (Exception e)
            {
                throw e;
            }
            return value;
        }

        public static DataSet LoginIntoProject(string username, string Password)
        {
            try
            {
                DataSet Dat = new DataSet();
                string sp_name = "LoginIntoproject";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@EmailOrUserName", username);
                param[1] = new SqlParameter("@password", Password);
                Dat = SqlHelper.ExecuteDataset(SqlHelper.ConnectionString(), CommandType.StoredProcedure, sp_name, param);
                return Dat;
            }
            catch { throw; }
        }

        public static int AdminLogin(string username, string Password)
        {
            try
            {
                string sp_name = "AdminLogin";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@EmailOrUserName", username);
                param[1] = new SqlParameter("@password", Password);
                int value = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.ConnectionString(), sp_name, param));
                return value;
            }
            catch (Exception e)
            {
                throw e;
            }


        }


        public static int UserLogin(string username, string password)
        {
            try
            {
                string sp_name = "UserLogin";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@EmailOrUserName", username);
                param[1] = new SqlParameter("@password", password);
                int value = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.ConnectionString(), sp_name, param));
                return value;
            }
            catch (Exception e)
            {
                throw e;
            }
        }


    }
}