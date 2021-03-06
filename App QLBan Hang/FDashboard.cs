﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace App_QLBan_Hang
{
    public partial class FDashboard : FTemplate
    {
        private static FDashboard currentShow;

        public static FDashboard CurrentShow
        {
            get
            {
                return currentShow;
            }

            set
            {
                currentShow = value;
            }
        }

        public FDashboard()
        {
            CurrentShow = this;
            InitializeComponent();
            btn_nhanvien_Click(null, null);
        }

        public static void openUserControl(UserControl uc)
        {
            CurrentShow.transitionPage.openGUINoAnimation(uc);
        }

        private void btn_menu_Click(object sender, EventArgs e)
        {
            int MIN_PANEL_MENU = 45;
            int MAX_PANEL_MENU = 282;
            int width = panel99.Width == MIN_PANEL_MENU ? MAX_PANEL_MENU : MIN_PANEL_MENU;

            panel99.Visible = false;
            panel99.Width = width;
            bunifuTransition.Show(panel99);

        }

        private void btn_thoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_nhanvien_Click(object sender, EventArgs e)
        {
            transitionPage.openGUI(new Dashboard.UCNhanVien());
        }

        private void btn_khachhang_Click(object sender, EventArgs e)
        {
            transitionPage.openGUI(new Dashboard.UCKhachHang());
        }

        private void btn_size_mau_Click(object sender, EventArgs e)
        {
            transitionPage.openGUI(new Dashboard.UCSizeMau());
        }

        private void btn_sanpham_Click(object sender, EventArgs e)
        {
            transitionPage.openGUI(new Dashboard.UCSanPham());
        }

        private void btn_nhacungcap_Click(object sender, EventArgs e)
        {
            transitionPage.openGUI(new Dashboard.UCNhaCungCap());
        }

        private void brn_nhaphang_Click(object sender, EventArgs e)
        {
            transitionPage.openGUI(new Dashboard.UCNhapHang());
        }
    }
}
