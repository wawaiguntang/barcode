<?php
include_once APPPATH . '/third_party/FPDF/fpdf.php';


class Fpdf_header_pembelian extends FPDF
{
    // Page header
    public $pembelian;
    public $isDo = false;

    public $title = 'FAKTUR PEMBELIAN';
    function Header()
    {
        $this->SetMargins(5, 1, 5);

        $this->SetY(3);
        $width = $this->isDo ? 74 : 74;
        $this->SetFont('Arial', '', 10);
        $this->Image(base_url('assets/img/logos/logo-1.png'), 5, 2, -600);

        $this->SetFont('Arial', 'B', 14);
        $this->Cell(0, 4,  $this->title, 0, 0, 'C');
        $this->SetFont('Arial', '', 8);
        $this->Cell(0, 6, date('Y-m-d H:i:s'), 0, 1, 'R');
        $this->SetFont('Arial', '', 11);
        $this->Cell($width, 4);
        $this->SetFont('Arial', 'B', 14);
        $this->Cell(53, 5, $this->pembelian->supplier->nmsupplier, 0, 0, 'C');
        $this->SetFont('Arial', '', 11);
        $this->Cell(20, 4, 'Ekspedisi', 0, 0, 'L');
        $this->Cell(2, 4, ':', 0, 0, 'C');
        $this->MultiCell(0, 4, $this->pembelian->do->ekspedisi, 0, 'L');
        $y = $this->GetY() >=  25 ? -5 : ($this->GetY() == 17 ? 4 : 12);
        $this->SetFont('Arial', '', 10);
        $this->Cell($width, $y, 'Jl A.Yani No:205 Margorahayu  II', 0, 0, 'L');
        $this->SetFont('Arial', '', 11);
        $this->Cell(53, $y, 'Tanggal : ' . $this->pembelian->tgl_transaksi, 0, 0, 'C');
        $this->Cell(20, 4, 'Plat', 0, 0, 'L');
        $this->Cell(2, 4, ':', 0, 0, 'C');
        $this->Cell(0, 4, $this->pembelian->do->plat, 0, 1, 'L');
        $this->Cell(0, 0, '', 0, 1, 'L');
        $this->SetFont('Arial', '', 10);
        $this->Cell($this->isDo ? 127 : 127, $y, 'Kota Gajah, Lampung Tengah ', 0, 0, 'L');
        $this->SetFont('Arial', '', 11);
        $this->Cell(20, 4, 'Supir', 0, 0, 'L');
        $this->Cell(2, 4, ':', 0, 0, 'C');
        $this->Cell(0, 4, $this->pembelian->do->supir, 0, 1, 'L');
        $this->Cell($this->isDo ? 127 : 127, $y, '', 0, 0, 'L');
        $this->Cell(20, 4, 'Faktur', 0, 0, 'L');
        $this->Cell(2, 4, ':', 0, 0, 'C');
        $this->Cell(0, 4, $this->pembelian->nofaktur, 0, 1, 'L');
        // $this->Cell(190, 4, 'Email : ' . $this->pembelian->supplier->email, 0, 1, 'R');
        $this->Ln(5);
    }
    // Page footer
    function Footer()
    {
        // Position at 1.5 cm from bottom
        $this->SetY(-8);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 10, 'Page ' . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }
}
