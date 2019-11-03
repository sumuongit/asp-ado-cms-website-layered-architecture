using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BOL;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace DAL
{
    public class AchievementDataAccessLayer:Repository
    {
        public DataTable SelectAllInformation_StaticPage()
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("SelectAll_Achievement_StaticPage", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                da.Fill(dt);
                return dt;
            }
            catch
            {
                throw;
            }
            finally
            {
                dt.Dispose();
                da.Dispose();
                cmd.Dispose();
                con.Close();
                con.Dispose();
            }

        }
        public DataTable SelectInformationById(int id)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("SelectById_Achievement", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@AchievementId", id);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                da.Fill(dt);
                return dt;
            }
            catch
            {
                throw;
            }
            finally
            {
                dt.Dispose();
                da.Dispose();
                cmd.Dispose();
                con.Close();
                con.Dispose();
            }
        }

        public DataTable SelectAllInformation()
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("SelectAll_Achievement", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                da.Fill(dt);
                return dt;
            }
            catch
            {
                throw;
            }
            finally
            {
                dt.Dispose();
                da.Dispose();
                cmd.Dispose();
                con.Close();
                con.Dispose();
            }

        }

        public int InsertInformation(AchievementObject achievementObj)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("Insert_Achievement", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@AchievementTitle", achievementObj.AchievementTitle);
            cmd.Parameters.AddWithValue("@AchievementDetail", achievementObj.AchievementDetail);
            cmd.Parameters.AddWithValue("@UserId", achievementObj.UserId);
            cmd.Parameters.AddWithValue("@Status", achievementObj.Status);

            try
            {
                return cmd.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                cmd.Dispose();
                con.Close();
                con.Dispose();
            }

        }

        public int UpdateInformation(AchievementObject achievementObj)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("Update_Achievement", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@AchievementId", achievementObj.AchievementId);
            cmd.Parameters.AddWithValue("@AchievementTitle", achievementObj.AchievementTitle);
            cmd.Parameters.AddWithValue("@AchievementDetail", achievementObj.AchievementDetail);
            cmd.Parameters.AddWithValue("@UserId", achievementObj.UserId);
            cmd.Parameters.AddWithValue("@Status", achievementObj.Status);

            try
            {
                return cmd.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                cmd.Dispose();
                con.Close();
                con.Dispose();
            }
        }
        public int DeleteInformation(AchievementObject achievementObj)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("Delete_Achievement", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@AchievementId", achievementObj.AchievementId);
            cmd.Parameters.AddWithValue("@UserId", achievementObj.UserId);

            try
            {
                return cmd.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                cmd.Dispose();
                con.Close();
                con.Dispose();
            }
        }
    }
}