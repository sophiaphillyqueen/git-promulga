package me::brancha;
use me::modus;
use me::systo;
use wraprg;
use strict;


sub do_merge {
  my $lc_last;
  my $lc_lsta;
  my @lc_brgo;
  my $lc_raw;
  my $lc_act;
  ($lc_last,$lc_lsta) = split(/:/,$_[0],2);
  $lc_last = &me::modus::brnc_trp($lc_last);
  @lc_brgo = split(/:/,$lc_lsta);
  foreach $lc_raw (@lc_brgo)
  {
    $lc_act = &me::modus::brnc_trp($lc_raw);
    system('git checkout ' . &wraprg::bsc($lc_act) . ' --');
    if ( $lc_act ne $lc_last )
    {
      if ( $lc_act ne '' )
      {
        if ( $lc_act eq &me::modus::brnc_id() )
        {
          system('git merge ' . &wraprg::bsc($lc_last));
          $lc_last = $lc_act;
        }
      }
    }
  }
}

sub do_pull {
  &meta_pull($_[0],'x-');
}

sub do_prc_pull {
  my $lc_a;
  my $lc_b;
  ($lc_a,$lc_b) = split(/:/,$_[0],2);
  &meta_pull($lc_b,$lc_a);
}

sub meta_pull {
  my @lc_list;
  my @lc_remos;
  my $lc_e_br_a;
  my $lc_e_br_r;
  my $lc_e_rm;
  @lc_list = split(/:/,$_[0]);
  @lc_remos = &me::modus::remote_get();
  foreach $lc_e_br_a (@lc_list)
  {
    $lc_e_br_r = &me::modus::brnc_trp($lc_e_br_a);
    if ( $lc_e_br_r ne '' )
    {
      system('git checkout ' . &wraprg::bsc($lc_e_br_r) . ' --');
      if ( $lc_e_br_r eq &me::modus::brnc_id() )
      {
        foreach $lc_e_rm (@lc_remos)
        {
          &me::systo::do_prcsh($_[1] . ':git pull ' . &wraprg::bsc($lc_e_rm) . ' ' . &wraprg::bsc($lc_e_br_r));
        }
      }
    }
  }
}

sub do_push {
  &meta_push($_[0],'x-');
}

sub do_prc_push {
  my $lc_a;
  my $lc_b;
  ($lc_a,$lc_b) = split(/:/,$_[0],2);
  &meta_push($lc_b,$lc_a);
}

sub meta_push {
  my @lc_list;
  my @lc_remos;
  my $lc_e_br_a;
  my $lc_e_br_r;
  my $lc_e_rm;
  @lc_list = split(/:/,$_[0]);
  @lc_remos = &me::modus::remote_get();
  foreach $lc_e_br_a (@lc_list)
  {
    $lc_e_br_r = &me::modus::brnc_trp($lc_e_br_a);
    if ( $lc_e_br_r ne '' )
    {
      system('git checkout ' . &wraprg::bsc($lc_e_br_r) . ' --');
      if ( $lc_e_br_r eq &me::modus::brnc_id() )
      {
        foreach $lc_e_rm (@lc_remos)
        {
          &me::systo::do_prcsh($_[1] . ':git push ' . &wraprg::bsc($lc_e_rm) . ' ' . &wraprg::bsc($lc_e_br_r));
        }
      }
    }
  }
}


1;