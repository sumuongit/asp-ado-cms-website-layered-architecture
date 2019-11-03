using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL;
using DAL;
using System.Data;

namespace CMS_Website
{
    public partial class photo_gallery : System.Web.UI.Page
    {
        PhotoGalleryDataAccessLayer dal = new PhotoGalleryDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadPhotoGallery();
            
        }

        protected void LoadPhotoGallery()
        {
            DataTable dt = new DataTable();
            dt = dal.SelectAllInformation();
            DataView dv = dt.DefaultView;
            dv.RowFilter = "Status = True";
            DataTable dtNew = dv.ToTable();
            RepeaterPhotoGallery.DataSource = dtNew;
            RepeaterPhotoGallery.DataBind();
        }
    }
}