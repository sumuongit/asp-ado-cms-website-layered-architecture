using BOL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DAL
{
    public class StoryPhotoDataAccessLayer : Repository
    {
        public DataTable SelectInformationById(int id)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("SelectById_StoryPhoto", con);
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

        public DataTable SelectInformationByStoryId(int id)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("SelectByStoryId_StoryPhoto", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StoryId", id);

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

        public DataTable SelectAllInformation_StaticPage(int id)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("SelectAll_StoryPhoto_StaticPage", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StoryId", id);

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

        public DataTable SelectAllInformation_HomePage(int id)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("SelectAll_StoryPhoto_HomePage", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StoryId", id);

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

        public DataTable SelectInformationByUserId(int id)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("SelectByUserId_StoryPhoto", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", id);

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

            SqlCommand cmd = new SqlCommand("SelectAll_StoryPhoto", con);
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

        public void InsertInformation(DataTable dt)
        {
            SqlConnection con = GetConnection();
            con.Open();

           

            SqlBulkCopy sqlBulk = new SqlBulkCopy(con);
            sqlBulk.ColumnMappings.Add("StoryId", "StoryId");
            sqlBulk.ColumnMappings.Add("PhotoPath", "PhotoPath");
            sqlBulk.ColumnMappings.Add("Status", "Status");
            sqlBulk.DestinationTableName = "StoryPhoto";            
            sqlBulk.WriteToServer(dt);
            
            con.Close();
            con.Dispose();
            
        }

        public int UpdateInformation(StoryPhotoObject storyPhotoObj)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("Update_StoryPhoto", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PhotoId", storyPhotoObj.PhotoId);
            cmd.Parameters.AddWithValue("@StoryId", storyPhotoObj.StoryId);
            cmd.Parameters.AddWithValue("@PhotoPath", storyPhotoObj.PhotoPath);
            cmd.Parameters.AddWithValue("@Status", storyPhotoObj.Status);

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
        public int DeleteInformation(StoryPhotoObject storyPhotoObj)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("Delete_StoryPhoto", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PhotoId", storyPhotoObj.PhotoId);
            cmd.Parameters.AddWithValue("@StoryId", storyPhotoObj.StoryId);
      

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