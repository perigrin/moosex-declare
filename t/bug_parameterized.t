use Test::More;
use MooseX::Declare;

role TestRole (Str :$foo = 'bar') {
    method foo (ArrayRef $x) { }
    method bar (Str      $x) { }
}

class TestClass {
    with TestRole => { foo => 'bar' };
}

my $x = TestClass->new;
isa_ok($x, 'TestClass');
is_deeply($x->foo([]), []);
is($x->bar('baz'), 'baz');

done_testing;
