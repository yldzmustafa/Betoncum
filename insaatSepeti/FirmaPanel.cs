using MaterialSkin;
using MaterialSkin.Controls;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using Dapper;
using insaatSepeti.Class;

namespace insaatSepeti
{
    public partial class FirmaPanel : MaterialForm
    {
        int b = 0;
        public FirmaPanel(int a)
        {
            InitializeComponent();
            var materialSkinManager = MaterialSkinManager.Instance;
            materialSkinManager.EnforceBackcolorOnAllComponents = false; // üstte olacak
            materialSkinManager.AddFormToManage(this);
            
            materialSkinManager.Theme = MaterialSkinManager.Themes.DARK;
            materialSkinManager.ColorScheme = new ColorScheme(Primary.BlueGrey800, Primary.BlueGrey900, Primary.BlueGrey500, 
                Accent.Orange200, TextShade.WHITE);
            this.b = a;
        }
        public FirmaPanel()
        {
            
        }

        SqlConnection SqlCon = new SqlConnection("Data Source=DESKTOP-1VO3R9G;Initial Catalog=Betoncum;Integrated Security=True");
        private void FirmaPanel_Load(object sender, EventArgs e)
        {
           
            #region Ürünleri listeleyen metot
            FillDataGridView();
            #endregion

            #region il getiriyor
            SqlCommand komut = new SqlCommand("select * from iller", SqlCon);
            SqlCon.Open();
            SqlDataReader reader = komut.ExecuteReader();
            while (reader.Read())
            {
                boxİL.Items.Add(reader["isim"]);
            }
            SqlCon.Close();
            #endregion

            #region İlçeleri getiriyor
            SqlCommand komut1 = new SqlCommand("select * from ilceler", SqlCon);
            SqlCon.Open();
            SqlDataReader reader1 = komut1.ExecuteReader();
            while (reader1.Read())
            {
                boxİLCE.Items.Add(reader1["isim"]);
            }
            SqlCon.Close();
            #endregion

            #region Hakkında
            SqlCommand komut2 = new SqlCommand("select Hakkinda from FirmaDetay where FirmaID='" + b + "'", SqlCon);

            SqlDataReader dr2;

            SqlCon.Open();
            dr2 = komut2.ExecuteReader();

            while (dr2.Read())
            {
                txtHakkimizda.Text = dr2["Hakkinda"].ToString();
            }
            SqlCon.Close();
            #endregion

            #region Firma Adını getiriyor
            SqlCommand komut4 = new SqlCommand("select FirmaAdi from FirmaDetay where FirmaID='" + b + "'", SqlCon);

            SqlDataReader dr;

            SqlCon.Open();
            dr = komut4.ExecuteReader();

            while (dr.Read())
            {
                lblFirmaAdi.Text = dr["FirmaAdi"].ToString();
            }
            SqlCon.Close();
            #endregion

            #region Sipariş Durumu Güncelle
            SqlCommand komut7 = new SqlCommand("select * from Siparis where FirmaID='" + b + "'", SqlCon);
            SqlCon.Open();

            DataTable dataTable = new DataTable();

            dataTable.Columns.Add("satisid");
            dataTable.Columns.Add("musteriid");
            dataTable.Columns.Add("firmaid");
            dataTable.Columns.Add("siparistarihi");
            dataTable.Columns.Add("urunid");
            dataTable.Columns.Add("betoncesidi");
            dataTable.Columns.Add("cimentocesidi");
            dataTable.Columns.Add("katkicesidi");
            dataTable.Columns.Add("kivamcesidi");
            dataTable.Columns.Add("birimfiyati");
            dataTable.Columns.Add("miktar");
            dataTable.Columns.Add("firmaadi");
            dataTable.Columns.Add("siparisdurumu");

            SqlDataReader okuyucu = komut7.ExecuteReader();

            while (okuyucu.Read())
            {
                DataRow row = dataTable.NewRow();
                row["satisid"] = okuyucu["SatisID"];
                row["musteriid"] = okuyucu["MusteriID"];
                row["firmaid"] = okuyucu["FirmaID"];
                row["siparistarihi"] = okuyucu["SiparisTarihi"];
                row["urunid"] = okuyucu["UrunID"];
                row["betoncesidi"] = okuyucu["BetonCesidi"];
                row["cimentocesidi"] = okuyucu["CimentoCesidi"];
                row["katkicesidi"] = okuyucu["KatkiCesidi"];
                row["kivamcesidi"] = okuyucu["KivamCesidi"];
                row["birimfiyati"] = okuyucu["BirimFiyati"];
                row["miktar"] = okuyucu["Miktar"];
                row["firmaadi"] = okuyucu["Firma"];
                row["siparisdurumu"] = okuyucu["SiparisDurumu"];
                dataTable.Rows.Add(row);
            }
            dataGridView2.DataSource = dataTable;
            SqlCon.Close();

            #endregion

            bildirim();

        }

        void bildirim()
        {
            SqlCommand komut = new SqlCommand("select * from Bildirim where FirmaID=" + b, SqlCon);
            SqlCon.Open();


            DataTable dataTable = new DataTable();

            dataTable.Columns.Add("bildirimid");
            dataTable.Columns.Add("firmaid");
            dataTable.Columns.Add("baslik");
            dataTable.Columns.Add("konu");

            SqlDataReader okuyucu = komut.ExecuteReader();

            while (okuyucu.Read())
            {
                DataRow row = dataTable.NewRow();
                row["bildirimid"] = okuyucu["BildirimID"];
                row["firmaid"] = okuyucu["FirmaID"];
                row["baslik"] = okuyucu["Baslik"];
                row["konu"] = okuyucu["Konu"];

                dataTable.Rows.Add(row);
            }
            dataGridView3.DataSource = dataTable;
            dataGridView3.Columns[0].Visible = false;
            dataGridView3.Columns[1].Visible = false;
            dataGridView3.Columns[2].Width = 220;
            dataGridView3.Columns[3].Width = 220;
            SqlCon.Close();

        }

        #region Firma bilgileri güncelleyen buton
        private void btnKaydet_Click(object sender, EventArgs e)
        {
            try
            {
                if (SqlCon.State == ConnectionState.Closed)
                    SqlCon.Open();
                DynamicParameters param = new DynamicParameters();
                param.Add("@firmaAdi", txtFirmaAdı.Text.Trim());
                param.Add("@firmatel", txtTelefon.Text.Trim());
                param.Add("@firmaEmail", txtMail.Text.Trim());
                param.Add("@firmail", boxİL.Text.Trim());
                param.Add("@firmailce", boxİLCE.Text.Trim());
                param.Add("@id", b);
                SqlCon.Execute
                    ("firmabilgileriduzenle", param, commandType: CommandType.StoredProcedure);
                MessageBox.Show("Güncelleme Başarılı");
                txtFirmaAdı.Clear();
                txtTelefon.Clear();
                txtMail.Clear();
            }
            catch (Exception)
            {
                MessageBox.Show("Güncelleme Yapılamadı");

            }
            finally
            {
                SqlCon.Close();
            }
        }
        #endregion

       
        #region Firma Giriş Bilgileri Güncelleye Buton
        private void btnGuncelle_Click(object sender, EventArgs e)
        {
            try
            {
                if (SqlCon.State == ConnectionState.Closed)
                    SqlCon.Open();
                DynamicParameters param1 = new DynamicParameters();
                param1.Add("@firmakullaniciadi", txtKullaniciAdi.Text.Trim());
                param1.Add("@firmasifre", txtSifre.Text.Trim());
                param1.Add("@id", b);

                SqlCon.Execute
                    ("firmagirisbilgileriduzenle", param1, commandType: CommandType.StoredProcedure);
                MessageBox.Show("Güncelleme Başarılı");
                txtKullaniciAdi.Clear();
                txtSifre.Clear();
            }
            catch (Exception)
            {
                MessageBox.Show("Güncelleme Yapılamadı");

            }
            finally
            {
                SqlCon.Close();
            }
        }
        #endregion


        #region Açık Tema Koyu Tema
        private void Tema_CheckedChanged(object sender, EventArgs e)
        {
            MaterialSkinManager MaterialSkin = MaterialSkinManager.Instance;

            if (Tema.Checked)
            {
                MaterialSkin.Theme = MaterialSkinManager.Themes.LIGHT;
            }
            else
                MaterialSkin.Theme = MaterialSkinManager.Themes.DARK;
        }

        #endregion

        #region Login ekranına yönlendiren Çıkış Buton
        private void materialButton1_Click(object sender, EventArgs e)
        {
            LoginEkranı loginEkranı = new LoginEkranı();
            this.Hide();
            loginEkranı.Show();
        }

        #endregion

        #region Ürün Ekleme Butonu
        private void btnEkle_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtUrunAdi.Text == "" || txtFiyat.Text == "" || boxStok.Text == "")
                {
                    MessageBox.Show("Alanlar Boş Geçilemez");
                }
                else
                {
                    if (SqlCon.State == ConnectionState.Closed)
                    {
                        SqlCon.Open();
                    }

                    DynamicParameters param = new DynamicParameters();
                    param.Add("@urunadi", txtUrunAdi.Text.Trim());
                    param.Add("@birimfiyati", txtFiyat.Text.Trim());
                    param.Add("@stok", boxStok.Text);
                    param.Add("@firmaid", b);

                    SqlCon.Execute("urunEkle", param, commandType: CommandType.StoredProcedure);

                    FillDataGridView();
                    clear();
                }


            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
            finally // en son işi yapıyor
            {
                SqlCon.Close();
            }
        }
        #endregion

        #region Ürünleri Listeleyen Metot FillDataGridView
        void FillDataGridView()// veritabanını listeliyor
        {
            DynamicParameters dynamic = new DynamicParameters();
            dynamic.Add("@firmaid", b);

            List<Urunler> list = SqlCon.Query<Urunler>//Query kullanıyoruz çünkü liste döndürdük
                ("urunListele",dynamic, commandType: CommandType.StoredProcedure).ToList<Urunler>();

            dataGridView1.DataSource = list;
            dataGridView1.Columns[0].Visible = false;
            dataGridView1.Columns[2].Visible = false;

        }
        #endregion

        #region Verileri Temizleyen clear metodu
        void clear()
        {
            txtFiyat.Clear();
            txtUrunAdi.Clear();
            textBox1.Clear();
        }
        #endregion

        #region Ürün Silme Butonu
        private void btnurunsil_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtUrunAdi.Text == "")
                {
                    MessageBox.Show("Silmek istediğiniz ürünü seçiniz!");
                }
                else
                {
                    if (SqlCon.State == ConnectionState.Closed)
                    {
                        SqlCon.Open();
                    }

                    DynamicParameters param = new DynamicParameters();
                    param.Add("@id", int.Parse(textBox1.Text));
                    param.Add("@betonadi", txtUrunAdi.Text);

                    SqlCon.Execute("urunSil", param, commandType: CommandType.StoredProcedure);



                    FillDataGridView();
                    clear();
                }

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
            finally // en son işi yapıyor
            {
                SqlCon.Close();
            }
        }
        #endregion

        #region Ürün Güncelleyen Buton
        private void btnurunguncelle_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtUrunAdi.Text == "" || txtFiyat.Text == "" || boxStok.Text == "")
                {
                    MessageBox.Show("Alanlar Boş Geçilemez");
                }
                else
                {
                    if (SqlCon.State == ConnectionState.Closed)
                    {
                        SqlCon.Open();
                    }

                    DynamicParameters param = new DynamicParameters();
                    param.Add("@id", int.Parse(textBox1.Text));
                    param.Add("@urunadi", txtUrunAdi.Text.Trim());
                    param.Add("@birimfiyati", txtFiyat.Text.Trim());
                    param.Add("@stok", boxStok.Text);

                    SqlCon.Execute("urunGuncelle", param, commandType: CommandType.StoredProcedure);



                    FillDataGridView();
                    clear();
                }

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
            finally // en son işi yapıyor
            {
                SqlCon.Close();
            }
        }
        #endregion

        #region Ürün Textlerini dolduran DataGridView1'ın doubleclick'i
        private void dataGridView1_DoubleClick(object sender, EventArgs e)
        {
            textBox1.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            txtUrunAdi.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            txtFiyat.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
        }
        #endregion

        #region Firmanın Hakkında bilgilerini kaydeden buton
        private void btnHakkindaKaydet_Click(object sender, EventArgs e)
        {
            SqlCon.Open();

            using (SqlCommand komut3 = new SqlCommand())
            {
                komut3.Connection = SqlCon;
                komut3.CommandType = CommandType.Text;
                komut3.CommandText = "update FirmaDetay set Hakkinda=@hakkinda where FirmaID='" + b + "'";

                komut3.Parameters.AddWithValue("@hakkinda", txtHakkimizda.Text);

                if (komut3.ExecuteNonQuery() == 1)
                {
                    MessageBox.Show("Bilgileriniz Güncellendi!");
                }
                else
                    MessageBox.Show("Bilgiler Güncellenemedi!");
            }
            SqlCon.Close();

        }
        #endregion

     
        #region Firma Sipariş Durumu Güncelleme Butonu
        private void materialButton2_Click(object sender, EventArgs e)
        {
            try
            {
                if (SqlCon.State == ConnectionState.Closed)
                    SqlCon.Open();
                DynamicParameters param = new DynamicParameters();
                param.Add("@id", int.Parse(textBox2.Text));
                param.Add("@siparisdurum", boxSiparisDurumu.Text);

                SqlCon.Execute
                    ("siparisdurumuguncelle", param, commandType: CommandType.StoredProcedure);
                MessageBox.Show("Güncelleme Başarılı");
            }
            catch (Exception)
            {
                MessageBox.Show("Güncelleme Yapılamadı");

            }
            finally
            {
                SqlCon.Close();
            }

            FirmaPanel_Load(this, null);
        }
        #endregion

        
        #region Firma Sipariş Durumunu güncellerken firma id yi tutma
        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox2.Text = dataGridView2.CurrentRow.Cells[0].Value.ToString();
        }

        #endregion

        
        #region Firma Tarafı Bildirim Kısmı Ekle Butonu
        private void materialButton3_Click(object sender, EventArgs e)
        {
            SqlCommand eklekomut = new SqlCommand();
            SqlCon.Open();

            eklekomut.Connection = SqlCon;
            eklekomut.CommandType = CommandType.Text;
            eklekomut.CommandText = "insert into Bildirim(FirmaID,Baslik,Konu)" +
                "values(@firmaid,@Baslik,@Konu)";
            eklekomut.Parameters.AddWithValue("@Baslik", txtBaslik.Text);
            eklekomut.Parameters.AddWithValue("@firmaid", b);
            eklekomut.Parameters.AddWithValue("@Konu", txtKonu.Text);

            if (eklekomut.ExecuteNonQuery() == 1)
                MessageBox.Show("Bildirim Eklendi");
            else
                MessageBox.Show("Bildirim Eklenmedi");
            SqlCon.Close();
            FirmaPanel_Load(this, null);
        }
        #endregion

        #region Firma Kısmı Bildirim Kısmı Sil Butonu
        private void materialButton4_Click(object sender, EventArgs e)
        {
            SqlCommand silkomut = new SqlCommand();
            SqlCon.Open();

            silkomut.Connection = SqlCon;
            silkomut.CommandType = CommandType.Text;
            silkomut.CommandText = "delete from Bildirim where BildirimID=@id";
            silkomut.Parameters.AddWithValue("@id", int.Parse(textBox3.Text));

            if (silkomut.ExecuteNonQuery() == 1)
                MessageBox.Show("Bildirim Eklendi");
            else
                MessageBox.Show("Bildirim Silindi");
            SqlCon.Close();
            FirmaPanel_Load(this, null);
        }

        #endregion

        #region Firma Bildirim için Firma id yi tutuyor
        private void dataGridView3_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox3.Text = dataGridView3.CurrentRow.Cells[0].Value.ToString();
        }
        #endregion
    }
}
