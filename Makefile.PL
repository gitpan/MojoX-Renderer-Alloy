
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Base class for Template::Alloy renderer',
  'AUTHOR' => 'Alex J. G. Burzyński <ajgb@cpan.org>',
  'BUILD_REQUIRES' => {
    'Module::Build' => '0.3601'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31',
    'Module::Build' => '0.3601'
  },
  'DISTNAME' => 'MojoX-Renderer-Alloy',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'MojoX::Renderer::Alloy',
  'PREREQ_PM' => {
    'Mojolicious' => '1.01',
    'Template::Alloy' => '1.013'
  },
  'VERSION' => '1.110180',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



