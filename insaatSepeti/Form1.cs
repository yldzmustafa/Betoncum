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
using System.Runtime.InteropServices; //radius
using insaatSepeti.Class;
using Dapper;
using System.Data.SqlClient;

namespace insaatSepeti
{
    public partial class Form1 : MaterialForm
    {
        //[DllImport("Gdi32.dll", EntryPoint = "CreateRoundRectRgn")]
        //private static extern IntPtr CreateRoundRectRgn
        //(
        //    int nLeftRect,     // x-coordinate of upper-left corner
        //    int nTopRect,      // y-coordinate of upper-left corner
        //    int nRightRect,    // x-coordinate of lower-right corner
        //    int nBottomRect,   // y-coordinate of lower-right corner
        //    int nWidthEllipse, // height of ellipse
        //    int nHeightEllipse // width of ellipse
        //);

        SqlConnection sqlcon = new SqlConnection("Data Source=DESKTOP-1VO3R9G;Initial Catalog=Betoncum;Integrated Security=True");
        int b = 0;
        public Form1(int a)
        {
            InitializeComponent();
            var materialSkinManager = MaterialSkinManager.Instance;
            materialSkinManager.EnforceBackcolorOnAllComponents = false;
            materialSkinManager.AddFormToManage(this);
            materialSkinManager.Theme = MaterialSkinManager.Themes.DARK;
            materialSkinManager.ColorScheme = new ColorScheme(Primary.BlueGrey800, Primary.BlueGrey900, Primary.BlueGrey500, Accent.LightBlue200, TextShade.WHITE);
            // this.Region = System.Drawing.Region.FromHrgn(CreateRoundRectRgn(0, 0, Width, Height, 20, 20));
            this.b = a;
        }


        
        #region Kullanıcı Kayıt Bilgileri Güncelleme
        private void btnKaydet_Click(object sender, EventArgs e)
        {
            try
            {
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();
                }
                DynamicParameters dynamic = new DynamicParameters();
                dynamic.Add("@ad", txtKullaniciAd.Text.Trim());
                dynamic.Add("@soyad", txtKullaniciSoyad.Text.Trim());
                dynamic.Add("@il", boxİL.Text.Trim());
                dynamic.Add("@ilce", boxİLCE.Text.Trim());
                dynamic.Add("@tel", txtTelefon.Text.Trim());
                dynamic.Add("@mail", txtMail.Text.Trim());
                dynamic.Add("@adres", txtAdres.Text.Trim());
                dynamic.Add("@id", b);
                sqlcon.Execute("kullanicibilgileriduzenle", dynamic, commandType: CommandType.StoredProcedure);
                MessageBox.Show("Güncelleme Başarılı");
                txtKullaniciAd.Clear();
                txtKullaniciSoyad.Clear();
                txtTelefon.Clear();
                txtMail.Clear();
                txtAdres.Clear();
            }
            catch (Exception)
            {

                MessageBox.Show("Güncelleme Yapılamadı");
            }
            finally
            {
                sqlcon.Close();
            }
        }
        #endregion

        
        #region Kullanıcı Giriş Bilgileri Güncelleme
        private void btnGuncelle_Click(object sender, EventArgs e)
        {
            try
            {
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();
                }

                DynamicParameters dynamic = new DynamicParameters();
                dynamic.Add("@kullaniciadi", txtKullaniciAdi.Text.Trim());
                dynamic.Add("@kullanicisifresi", txtSifre.Text.Trim());
                dynamic.Add("@id", b);

                sqlcon.Execute("kullanicigirisbilgileriduzenle", dynamic, commandType: CommandType.StoredProcedure);
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
                sqlcon.Close();
            }
        }
        #endregion

        
        #region Açık Tema Koyu Tema
        private void Tema_CheckedChanged(object sender, EventArgs e)
        {
            var materialSkinManager = MaterialSkinManager.Instance;

            if (Tema.Checked)
            {
                materialSkinManager.Theme = MaterialSkinManager.Themes.LIGHT;
            }
            else
                materialSkinManager.Theme = MaterialSkinManager.Themes.DARK;


        }
        #endregion


        //Sipariş verme sayfasındaki ürünlerin listelenmesini sağlayan kodlar burda
        #region Şirketi seçtiğimde sipariş vermeye yönlendiren datagridwie3' ün doubleclicki
        private void dataGridView3_DoubleClick(object sender, EventArgs e)
        {
            materialTabControl1.SelectTab(tabPage3);
            firmaidtut.Text = dataGridView3.CurrentRow.Cells[6].Value.ToString();
            boxBetoncesidi.Items.Clear();
            SqlCommand komut2 = new SqlCommand("select * from Urunler where Stok='Var' and FirmaID= "+int.Parse(firmaidtut.Text), sqlcon);
            sqlcon.Open();
            SqlDataReader reader2 = komut2.ExecuteReader();
            while (reader2.Read())
            {
                boxBetoncesidi.Items.Add(reader2["UrunAdi"]);
            }
            sqlcon.Close();

        }
        #endregion
        

        
        #region Favori şirketi seçtiğimde sipariş vermeye yönlendiren datagridview4'ün doubleclicki
        private void dataGridView4_DoubleClick(object sender, EventArgs e)
        {
            materialTabControl1.SelectTab(tabPage3);

        }
        #endregion


        #region Şirketleri listeleyen metot FillDataGirdView
        void FillDataGridView()// veritabanını listeliyor
        {

            DynamicParameters param = new DynamicParameters();
            param.Add("@Aramametni", txtAra.Text.Trim());

            List<FirmaDetay> list = sqlcon.Query<FirmaDetay>//Query kullanıyoruz çünkü liste döndürdük
                ("FirmaArama", param, commandType: CommandType.StoredProcedure).ToList<FirmaDetay>();

            dataGridView3.DataSource = list;
            dataGridView3.Columns[0].Visible = false;
            dataGridView3.Columns[6].Visible = false;
        }

        #endregion

        #region Sipariş metodu
        void siparismetodu()
        {
            DynamicParameters dynamicParameters = new DynamicParameters();
            dynamicParameters.Add("@id", b);
            List<Siparis> list1 = sqlcon.Query<Siparis>("siparislistele", dynamicParameters, commandType: CommandType.StoredProcedure).ToList<Siparis>();
            dataGridView2.DataSource = list1;
            dataGridView1.DataSource = list1;
            dataGridView2.Columns[0].Visible = false;
            dataGridView2.Columns[1].Visible = false;
            dataGridView2.Columns[2].Visible = false;
            dataGridView2.Columns[4].Visible = false;

            dataGridView1.Columns[0].Visible = false;
            dataGridView1.Columns[1].Visible = false;
            dataGridView1.Columns[2].Visible = false;
            dataGridView1.Columns[4].Visible = false;

            dataGridView5.DataSource = list1;
            dataGridView5.Columns[0].Visible = false;
            dataGridView5.Columns[1].Visible = false;
            dataGridView5.Columns[2].Visible = false;
            dataGridView5.Columns[4].Visible = false;
        }
        #endregion

        private void Form1_Load(object sender, EventArgs e)
        {

            #region Şirketler

            try
            {
                FillDataGridView();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }


            #endregion

            #region İl ve İlçeleri Getiren Kod
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
            #endregion


            #region Favorileri listeleme
            try
            {
                FillDataGridView2();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
            #endregion


            #region Siparişleri ve sipariş takibini listeleyen metot

            siparismetodu();

            #endregion

            bildirim();


            clear();


        }

        #region Bildirim Metodu
        void bildirim()
        {
            SqlCommand komut = new SqlCommand("select * from Bildirim", sqlcon);
            sqlcon.Open();
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
            dataGridView6.DataSource = dataTable;
            dataGridView6.Columns[0].Visible = false;
            dataGridView6.Columns[1].Visible = false;
            dataGridView6.Columns[2].Width = 270;
            dataGridView6.Columns[3].Width = 273;
            sqlcon.Close();
        }
        #endregion

        #region Verileri Temizleyen clear metodu
        private void clear()
        {
            txtMiktar.Clear();
            txtSiparisTarihi.Clear();
        }
        #endregion

        int c = 0;

        #region Sipariş Verme Butonu
        private void btnSiparisVer_Click(object sender, EventArgs e)
        {
            c = int.Parse(firmaidtut.Text);
            if (firmaidtut.Text == "")
            {
                MessageBox.Show("Lütfen Şirketler Sayfasından Sipariş Vermek İstediğiniz Şirketi Seçiniz !");
            }
            else
            {
                try
                {
                    if (sqlcon.State == ConnectionState.Closed)
                    {
                        sqlcon.Open();
                    }

                    DynamicParameters dynamicParameters = new DynamicParameters();
                    dynamicParameters.Add("@musteriid", b);
                    dynamicParameters.Add("@firmaid", c);
                    dynamicParameters.Add("@siparistarihi", txtSiparisTarihi.Text.Trim());
                    dynamicParameters.Add("@betoncesidi", boxBetoncesidi.Text.Trim());
                    dynamicParameters.Add("@cimentocesidi", boxCimentoCesidi.Text.Trim());
                    dynamicParameters.Add("@katkicesidi", boxKatkiCesidi.Text.Trim());
                    dynamicParameters.Add("@kivamcesidi", boxKivam.Text.Trim());
                    dynamicParameters.Add("@miktar", txtMiktar.Text.Trim());
                    dynamicParameters.Add("@siparisdurumu", "Sipariş Alındı");
                    

                    sqlcon.Execute("SiparisEkle", dynamicParameters, commandType: CommandType.StoredProcedure);

                    siparismetodu();
                    clear();

                }
                catch (Exception)
                {

                    MessageBox.Show("Sipariş Verilemedi");
                }
                finally
                {
                    sqlcon.Close();
                }
            }


            materialFloatingActionButton1.Mini = false;
            materialFloatingActionButton1.Location = new Point(191, 83);
        }
        #endregion

        
        #region Favoriye Ekleme Butonu
        private void btnFavoriEkle_Click(object sender, EventArgs e)
        {

            try
            {
                if (textBox2.Text == "")
                {
                    MessageBox.Show("Lütfen Favoriye Eklenecek Firmayı Seçiniz!");
                }
                else
                {
                    if (sqlcon.State == ConnectionState.Closed)
                    {
                        sqlcon.Open();
                    }

                    DynamicParameters param = new DynamicParameters();
                    param.Add("@firmaid", int.Parse(textBox2.Text));
                    param.Add("@musteriid", b);
                    param.Add("@id", dbType: DbType.Int32, direction: ParameterDirection.Output);

                    sqlcon.Execute("favoriekle", param, commandType: CommandType.StoredProcedure);

                    MessageBox.Show("Favorilere Eklendi!");

                    FillDataGridView2();
                    FillDataGridView();
                    textBox2.Clear();
                }


            }
            catch (Exception)
            {

                MessageBox.Show("Favori Eklenemedi");
            }
            finally // en son işi yapıyor
            {
                sqlcon.Close();
            }
        }
        #endregion

        
        #region Favoriyi Listeleyen Metot FillDataGridView2
        void FillDataGridView2()
        {
            DynamicParameters dynamic = new DynamicParameters();
            dynamic.Add("@id", b);
            //List<Favoriler> list = sqlcon.Query<Favoriler>
            //    ("favorilistele", commandType: CommandType.StoredProcedure).ToList<Favoriler>();

            List<FirmaDetay> list2 = sqlcon.Query<FirmaDetay>
                ("favorilistelee",dynamic, commandType: CommandType.StoredProcedure).ToList<FirmaDetay>();

            dataGridView4.DataSource = list2;
            //dataGridView4.DataSource = list;
            dataGridView4.Columns[0].Visible = false;
            dataGridView4.Columns[6].Visible = false;

        }
        #endregion

        
        #region Çıkış Butonu
        private void materialButton1_Click_1(object sender, EventArgs e)
        {
            LoginEkranı loginEkranı = new LoginEkranı();
            this.Hide();
            loginEkranı.Show();
        }

        #endregion

        #region Şirket Arama Butonu
        private void btnAra_Click(object sender, EventArgs e)
        {
            FillDataGridView();
        }
        #endregion

        #region DataGridView3'e tıklayınca firmaid yi tutar
        private void dataGridView3_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox2.Text = dataGridView3.CurrentRow.Cells[6].Value.ToString();
          
        }
        #endregion

        
        #region Favori şirketleri silen buton
        private void materialButton2_Click(object sender, EventArgs e)
        {
            try
            {
                if (textBox3.Text == "")
                {
                    MessageBox.Show("Lütfen Silmek istediğiniz Firmayı Seçiniz!");
                }
                else
                {
                    if (sqlcon.State == ConnectionState.Closed)
                    {
                        sqlcon.Open();
                    }

                    DynamicParameters param = new DynamicParameters();
                    param.Add("@firmaid", int.Parse(textBox3.Text));


                    sqlcon.Execute("favorisil", param, commandType: CommandType.StoredProcedure);
                    MessageBox.Show("Favori Silindi!");
                    FillDataGridView2();

                    textBox3.Clear();
                }


            }
            catch (Exception)
            {

                MessageBox.Show("Favori Silinemedi");
            }
            finally // en son işi yapıyor
            {
                sqlcon.Close();
            }
        }
        #endregion

        #region dataGridView4'e tıklayınca firma idyi tutma
        private void dataGridView4_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox3.Text = dataGridView4.CurrentRow.Cells[6].Value.ToString();
        }

        #endregion


        #region Sipariş Durumunu Görüntüleyen Buton
        private void materialButton3_Click(object sender, EventArgs e)
        {
            switch (textBox4.Text)
            {
                case "Sipariş Alındı":
                    materialFloatingActionButton1.Mini = false;
                    materialFloatingActionButton1.Location = new Point(342, 316);
                    //////////////////////////////////
                    materialFloatingActionButton2.Mini = true;
                    materialFloatingActionButton2.Location = new Point(488, 324);

                    materialFloatingActionButton3.Mini = true;
                    materialFloatingActionButton3.Location = new Point(635, 323);

                    materialFloatingActionButton4.Mini = true;
                    materialFloatingActionButton4.Location = new Point(777, 324);
                    panel3.Visible = true;
                    panel4.Visible = false;
                    panel5.Visible = false;
                    panel6.Visible = false;
                    break;

                case "Hazırlanıyor":
                    materialFloatingActionButton1.Mini = false;
                    materialFloatingActionButton1.Location = new Point(342, 316);

                    materialFloatingActionButton2.Mini = false;
                    materialFloatingActionButton2.Location = new Point(484, 315);

                    //////////////////////////////////

                    materialFloatingActionButton3.Mini = true;
                    materialFloatingActionButton3.Location = new Point(635, 323);

                    materialFloatingActionButton4.Mini = true;
                    materialFloatingActionButton4.Location = new Point(777, 324);
                    panel3.Visible = true;
                    panel4.Visible = true;
                    panel5.Visible = false;
                    panel6.Visible = false;
                    break;

                case "Yola Çıktı":
                    materialFloatingActionButton1.Mini = false;
                    materialFloatingActionButton1.Location = new Point(342, 316);

                    materialFloatingActionButton2.Mini = false;
                    materialFloatingActionButton2.Location = new Point(484, 315);

                    materialFloatingActionButton3.Mini = false;
                    materialFloatingActionButton3.Location = new Point(628, 316);

                    ////////////////////////////////////////

                    materialFloatingActionButton4.Mini = true;
                    materialFloatingActionButton4.Location = new Point(777, 324);
                    panel3.Visible = true;
                    panel4.Visible = true;
                    panel5.Visible = true;
                    panel6.Visible = false;

                    break;

                case "Teslim Edildi":
                    materialFloatingActionButton1.Mini = false;
                    materialFloatingActionButton1.Location = new Point(342, 316);

                    materialFloatingActionButton2.Mini = false;
                    materialFloatingActionButton2.Location = new Point(484, 315);

                    materialFloatingActionButton3.Mini = false;
                    materialFloatingActionButton3.Location = new Point(628, 316);

                    materialFloatingActionButton4.Mini = false;
                    materialFloatingActionButton4.Location = new Point(772, 316);
                    panel3.Visible = true;
                    panel4.Visible = true;
                    panel5.Visible = true;
                    panel6.Visible = true;

                    break;

                default:
                    MessageBox.Show("Lütfen ilk önce siparişi seçiniz!");
                    break;
            }
        }
        #endregion

        #region Sipariş Takip sayfası sipariş durumunu tutan DatagridView5'in cellclik'i
        private void dataGridView5_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox4.Text = dataGridView5.CurrentRow.Cells[12].Value.ToString();
        }
        #endregion

        #region Bildirim kısmı datagridview doubleclik tıklayınca sipariş vermeye gidiyor
        private void dataGridView6_DoubleClick(object sender, EventArgs e)
        {
            materialTabControl1.SelectTab(tabPage3);
            firmaidtut.Text = dataGridView6.CurrentRow.Cells[1].Value.ToString(); // firma id
            boxBetoncesidi.Items.Clear();
            SqlCommand komut7 = new SqlCommand("select * from Urunler where FirmaID=" + int.Parse(firmaidtut.Text), sqlcon);
            sqlcon.Open();
            SqlDataReader reader7 = komut7.ExecuteReader();
            while (reader7.Read())
            {
                boxBetoncesidi.Items.Add(reader7["UrunAdi"]);
            }
            sqlcon.Close();
        }
        #endregion
    }
}
