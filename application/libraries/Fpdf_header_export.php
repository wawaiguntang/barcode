<?php
include_once APPPATH . '/third_party/FPDF/fpdf.php';


class Fpdf_header_export extends FPDF
{
    // Page header
    public $title = 'FAKTUR PENJUALAN';
    function Header()
    {

        $this->SetMargins(5, 2, 5);
        $this->SetY(4);
        $this->SetFont('Arial', '', 10);
        $this->Image(base_url('assets/img/logos/logo-1.png'), 5, 3, -600);
        $this->SetFont('Arial', 'B', 14);
        $this->Cell(0, 4,  $this->title, 0, 0, 'C');
        $this->SetFont('Arial', '', 8);
        $this->Cell(0, 6, date('Y-m-d H:i:s'), 0, 1, 'R');
        $this->Ln(10);
    }
    public function WordWrap(&$text, $maxwidth)
    {
        $text = trim($text);
        if ($text === '')
            return 0;
        $space = $this->GetStringWidth(' ');
        $lines = explode("\n", $text);
        $text = '';
        $count = 0;

        foreach ($lines as $line) {
            $words = preg_split('/ +/', $line);
            $width = 0;

            foreach ($words as $word) {
                $wordwidth = $this->GetStringWidth($word);
                if ($wordwidth > $maxwidth) {
                    // Word is too long, we cut it
                    for ($i = 0; $i < strlen($word); $i++) {
                        $wordwidth = $this->GetStringWidth(substr($word, $i, 1));
                        if ($width + $wordwidth <= $maxwidth) {
                            $width += $wordwidth;
                            $text .= substr($word, $i, 1);
                        } else {
                            $width = $wordwidth;
                            $text = rtrim($text) . "\n" . substr($word, $i, 1);
                            $count++;
                        }
                    }
                } elseif ($width + $wordwidth <= $maxwidth) {
                    $width += $wordwidth + $space;
                    $text .= $word . ' ';
                } else {
                    $width = $wordwidth + $space;
                    $text = rtrim($text) . "\n" . $word . ' ';
                    $count++;
                }
            }
            $text = rtrim($text) . "\n";
            $count++;
        }
        $text = rtrim($text);
        return $count;
    }
    // Page footer
    function Footer()
    {
        // Position at 1.5 cm from bottom
        $this->SetY(-6);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 1, 'Halaman ' . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }
}
