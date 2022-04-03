using MaterialSkin;
using MaterialSkin.Controls;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace insaatSepeti
{
    public partial class MusteriUyelik : MaterialForm
    {

        [DllImport("Gdi32.dll", EntryPoint = "CreateRoundRectRgn")]
        private static extern IntPtr CreateRoundRectRgn
        (
            int nLeftRect,     // x-coordinate of upper-left corner
            int nTopRect,      // y-coordinate of upper-left corner
            int nRightRect,    // x-coordinate of lower-right corner
            int nBottomRect,   // y-coordinate of lower-right corner
            int nWidthEllipse, // height of ellipse
            int nHeightEllipse // width of ellipse
        );

        public MusteriUyelik()
        {
            InitializeComponent();
            this.Region = System.Drawing.Region.FromHrgn(CreateRoundRectRgn(0, 0, Width, Height, 20, 20));
            var materialSkinManager = MaterialSkinManager.Instance;
            materialSkinManager.EnforceBackcolorOnAllComponents = false; // panel için
            materialSkinManager.AddFormToManage(this);
            materialSkinManager.Theme = MaterialSkinManager.Themes.DARK;
            materialSkinManager.ColorScheme = new ColorScheme(Primary.BlueGrey800, Primary.BlueGrey900, Primary.BlueGrey500,
                Accent.Orange200, TextShade.WHITE);
        }
        SqlConnection sqlcon = new SqlConnection("Data Source=DESKTOP-1VO3R9G;Initial Catalog=Betoncum;Integrated Security=True");
        private void MusteriUyelik_Load(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand("select * from iller", sqlcon);
            sqlcon.Open();
            SqlDataReader reader = komut.ExecuteReader();
            while (reader.Read())
            {
                boxİL.Items.Add(reader["isim"]);
            }
            sqlcon.Close();

            SqlCommand komut1 = new SqlCommand("select * from ilceler", sqlcon);
            sqlcon.Open();
            SqlDataReader reader1 = komut1.ExecuteReader();
            while (reader1.Read())
            {
                boxİLCE.Items.Add(reader1["isim"]);
            }
            sqlcon.Close();

        }

        private void btnKaydet_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("kullanicikayit", sqlcon))
            {
                try
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@adi", txtKullaniciAdi.Text);
                    cmd.Parameters.AddWithValue("@soyadi", txtKullaniciSoyad.Text);
                    cmd.Parameters.AddWithValue("@il", boxİL.Text);
                    cmd.Parameters.AddWithValue("@ilce", boxİLCE.Text);
                    cmd.Parameters.AddWithValue("@tel", txtTelefon.Text);
                    cmd.Parameters.AddWithValue("@email", txtMail.Text);
                    cmd.Parameters.AddWithValue("@adresi", materialMultiLineTextBox1.Text);

                    SqlParameter outPutParameter = new SqlParameter();
                    outPutParameter.ParameterName = "@id";
                    outPutParameter.SqlDbType = System.Data.SqlDbType.Int;
                    outPutParameter.Direction = System.Data.ParameterDirection.Output;
                    cmd.Parameters.Add(outPutParameter);
                    sqlcon.Open();
                    cmd.ExecuteNonQuery();
                    if (outPutParameter.Value.ToString() == "1")
                    {
                        MessageBox.Show("Kayıt Tamamlandı. Lütfen tekrardan Giriş Yapınız!");
                        LoginEkranı loginEkranı = new LoginEkranı();
                        this.Hide();
                        loginEkranı.Show();
                    }
                    else
                    {
                        MessageBox.Show("Eklenemedi");
                    }
                    sqlcon.Close();

                }
                catch (Exception ex)
                {
                    var sqlException = ex.InnerException as SqlException;
                    if (sqlException is null)
                    {
                        MessageBox.Show("eklenemedi");
                    }

                }
            }




          
        }
    }
}
