using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AddressBook.AdminPanel.FileUpload
{
    public partial class FileUploadDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fuFile.HasFile)
            {
                String FolderName = "~/UserContent/";
                String AbsolutePath=Server.MapPath(FolderName); 
                if(!Directory.Exists(AbsolutePath))
                    Directory.CreateDirectory(AbsolutePath);
                lblMessage.Text = "File Uploaded at "+AbsolutePath;
                fuFile.SaveAs(AbsolutePath + fuFile.FileName.ToString().Trim());
            }
            else
            {
                lblMessage.Text = "Please Choose File";
            }
        }

        protected void btnDeleteFile_Click(object sender, EventArgs e)
        {
            String FilePath = "~/UserContent/";
            FileInfo file= new FileInfo(Server.MapPath(FilePath));

            if (file.Exists) { 
                file.Delete();
            }
        }
    }
}