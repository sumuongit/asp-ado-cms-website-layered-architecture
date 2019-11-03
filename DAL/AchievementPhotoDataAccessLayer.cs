using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using BOL;

namespace DAL
{
    public class AchievementPhotoDataAccessLayer : Repository
    {
        public DataTable SelectAllInformation_StaticPage(int id)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("SelectAll_AchievementPhoto_StaticPage", con);
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
        public int UpdateInformation(AchievementPhotoObject achievementPhotoObj)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("Update_AchievementPhoto", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PhotoId", achievementPhotoObj.PhotoId);
            cmd.Parameters.AddWithValue("@AchievementId", achievementPhotoObj.AchievementId);
            cmd.Parameters.AddWithValue("@PhotoPath", achievementPhotoObj.PhotoPath);
            cmd.Parameters.AddWithValue("@Status", achievementPhotoObj.Status);

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
        public DataTable SelectInformationById(int id)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("SelectById_AchievementPhoto", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PhotoId", id);

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

            SqlCommand cmd = new SqlCommand("SelectAll_AchievementPhoto", con);
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

        public DataTable SelectInformationByAchievementId(int id)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("SelectByAchievementId_AchievementPhoto", con);
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
        public void InsertInformation(DataTable dt)
        {
            SqlConnection con = GetConnection();
            con.Open();
            SqlBulkCopy sqlBulk = new SqlBulkCopy(con);
            sqlBulk.ColumnMappings.Add("AchievementId", "AchievementId");
            sqlBulk.ColumnMappings.Add("PhotoPath", "PhotoPath");
            sqlBulk.ColumnMappings.Add("Status", "Status");
            sqlBulk.DestinationTableName = "AchievementPhoto";
            sqlBulk.WriteToServer(dt);

            con.Close();
            con.Dispose();

        }
    }
}