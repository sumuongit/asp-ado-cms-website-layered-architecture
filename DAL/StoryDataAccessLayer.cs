using BOL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DAL
{
    public class StoryDataAccessLayer:Repository
    {
        
        public DataTable SelectInformationById(int id)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("SelectById_Story", con);
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

            SqlCommand cmd = new SqlCommand("SelectByUserId_Story", con);
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

            SqlCommand cmd = new SqlCommand("SelectAll_Story", con);
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

        public DataTable SelectAllInformation_StaticPage()
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("SelectAll_Story_StaticPage", con);
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

        public int InsertInformation(StoryObject storyObj)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("Insert_Story", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@StoryTitle", storyObj.StoryTitle);
            cmd.Parameters.AddWithValue("@StoryDetail", storyObj.StoryDetail);
            cmd.Parameters.AddWithValue("@UserId", storyObj.UserId);
            cmd.Parameters.AddWithValue("@Status", storyObj.Status);

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

        public int UpdateInformation(StoryObject storyObj)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("Update_Story", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@StoryId", storyObj.StoryId);
            cmd.Parameters.AddWithValue("@StoryTitle", storyObj.StoryTitle);
            cmd.Parameters.AddWithValue("@StoryDetail", storyObj.StoryDetail);
            cmd.Parameters.AddWithValue("@UpdateDate", storyObj.UpdateDate);
            cmd.Parameters.AddWithValue("@Status", storyObj.Status);

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
        public int DeleteInformation(StoryObject storyObj)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("Delete_Story", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@StoryId", storyObj.StoryId);
            cmd.Parameters.AddWithValue("@UserId", storyObj.UserId);

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