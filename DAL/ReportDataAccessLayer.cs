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
    public class ReportDataAccessLayer:Repository
    {
      
        public DataTable SelectInformationById(int id)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("SelectById_Report", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ReportId", id);

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

            SqlCommand cmd = new SqlCommand("SelectAll_Report", con);
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

        public int InsertInformation(ReportObject reportObj)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("Insert_Report", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ReportTitle", reportObj.ReportTitle);
            cmd.Parameters.AddWithValue("@ReportPath", reportObj.ReportPath);
            cmd.Parameters.AddWithValue("@UserId", reportObj.UserId);
            cmd.Parameters.AddWithValue("@Status", reportObj.Status);

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

        public int UpdateInformation(ReportObject reportObj)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("Update_Report", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ReportId", reportObj.ReportId);
            cmd.Parameters.AddWithValue("@ReportTitle", reportObj.ReportTitle);
            cmd.Parameters.AddWithValue("@ReportPath", reportObj.ReportPath);
            cmd.Parameters.AddWithValue("@UserId", reportObj.UserId);
            cmd.Parameters.AddWithValue("@Status", reportObj.Status);

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
        public int DeleteInformation(ReportObject reportObj)
        {
            SqlConnection con = GetConnection();
            con.Open();

            SqlCommand cmd = new SqlCommand("Delete_Report", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ReportId", reportObj.ReportId);
            cmd.Parameters.AddWithValue("@UserId", reportObj.UserId);

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