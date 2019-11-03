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
    public class PhotoGalleryDataAccessLayer : Repository
    {
        
        public DataTable SelectInformationById(int id)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("SelectById_PhotoGallery", con);
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

            SqlCommand cmd = new SqlCommand("SelectAll_PhotoGallery", con);
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

        public int InsertInformation(PhotoGalleryObject photogalleryObj)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("Insert_PhotoGallery", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PhotoPath", photogalleryObj.PhotoPath);
            cmd.Parameters.AddWithValue("@PhotoBrief", photogalleryObj.PhotoBrief);
            cmd.Parameters.AddWithValue("@PhotoDetail", photogalleryObj.PhotoDetail);
            cmd.Parameters.AddWithValue("@UserId", photogalleryObj.UserId);
            cmd.Parameters.AddWithValue("@Status", photogalleryObj.Status);

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

        public int UpdateInformation(PhotoGalleryObject photogalleryObj)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("Update_PhotoGallery", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PhotoId", photogalleryObj.PhotoId);
            cmd.Parameters.AddWithValue("@PhotoPath", photogalleryObj.PhotoPath);
            cmd.Parameters.AddWithValue("@PhotoBrief", photogalleryObj.PhotoBrief);
            cmd.Parameters.AddWithValue("@PhotoDetail", photogalleryObj.PhotoDetail);
            cmd.Parameters.AddWithValue("@UserId", photogalleryObj.UserId);
            cmd.Parameters.AddWithValue("@Status", photogalleryObj.Status);

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
        public int DeleteInformation(PhotoGalleryObject photogalleryObj)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("Delete_PhotoGallery", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PhotoId", photogalleryObj.PhotoId);
            cmd.Parameters.AddWithValue("@UserId", photogalleryObj.UserId);

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