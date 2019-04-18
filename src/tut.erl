%%%-------------------------------------------------------------------
%%% @author yintian
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 三月 2019 23:50
%%%-------------------------------------------------------------------
-module(tut).
-author("yintian").

-import(string, [len/1, concat/2, chars/2, substr/2, str/2, to_lower/1, to_upper/1]).

%% API
-export([main/0]).

myAdd(A,B) ->
  A + B.

do_math_2(A) ->
  math:log(A).

%% not right
for(0, _) ->
  ok;
for(Max, Min) when Max > 0 ->
  io:fwrite("Num : ~p\n", [Max]),
  for(Max-1, Min).

list_stuff() ->
  List1 = [1,2,3],
  List2 = [4,5,6],

  List3 = List1 ++ List2,
  List3,

  List4 = List3 -- List1,
  List4,

  hd(List4),
  tl(List4),

  List5 = [3|List4],
  List5,

  [Head|Tail] = List5,
  Head.

lc_stuff() ->
  List1 = [1,2,3],
  List2 = [2*N || N <- List1],
  io:fwrite("~p",[List2]),

  List3 = [1,2,3,4],
  List4 = [N || N <- List3, N rem 2 == 0],
  io:fwrite("~p",[List4]),

  City_Weather = [{pittsburgh, 50}, {'new york', 53}, {charlotte, 68}, {miami, 78}],
  Great_Temp = [{City, Temp} || {City, Temp} <- City_Weather, Temp >= 65],
  io:fwrite("~p",[Great_Temp]).

type_stuff() ->
  io:fwrite("~p\n",[is_atom(chenKai)]),
  io:fwrite("~p\n",[is_float(3.22)]),
  io:fwrite("~p\n",[is_integer(10)]),
  io:fwrite("~p\n",[is_boolean(false)]),
  io:fwrite("~p\n",[is_list([1,2,3])]),
  io:fwrite("~p\n",[is_tuple({height, 22})]),

  List1 = integer_to_list(21),
  io:fwrite("~p\n", [List1]).

factorial(N) when N == 0 -> 1;
factorial(N) when N > 0 -> N * factorial(N - 1).

find_factorial(X) ->
  Y = factorial(X),
  io:fwrite("Factorial: ~p\n", [Y]).

sum([]) -> 0;
sum([H|T]) -> H + sum(T).

map_stuff() ->
  Bob = #{f_name=> "Bob", l_name=> "Smith"},
  io:fwrite("f_name: ~p\n", [maps:get(f_name, Bob)]),
  io:fwrite("~p\n", [maps:find(f_name, Bob)]),
  io:fwrite("~p\n", [maps:find(mother, Bob)]),
  io:fwrite("~p\n", [maps:put(address, "123 main", Bob)]).

-record(customer, {name ="", bal = 0.00}).

record_stuff() ->
  Sally = #customer{name = "Sally Smith", bal = 100.00},
  Sally2 = Sally#customer{bal = 50},
  io:fwrite("~p owes ~p\n", [Sally2#customer.name, Sally2#customer.bal]).

double(X) -> X * 2.
triple(X) -> X * 3.

hyper_fun() ->
  io:fwrite("~p\n", [lists:map(fun double/1, [1,2,3])]).

fun_stuff(N) ->
  Fun_stuff = fun() -> io:fwrite("Hello, ~p\n", [N]) end,
  Fun_stuff().

fun_stuff2() ->
  X = 3,
  Y = 4,
  Z = fun() ->
    io:fwrite("Sum: ~p\n", [X + Y]) end,
  Z().

write_txt(N) ->
  {ok, Fh} = file:open("MyFile.txt", [write]),
  file:write(Fh, N).

write_txt2(N) ->
  {ok, Fh} = file:open("MyFile.txt", [append]),
  file:write(Fh, N).

read_txt() ->
  {ok, File} = file:open("MyFile.txt", [read]),
  Words = file:read(File, 1024 * 1024),
  io:fwrite("~p\n", Words).

error_stuff(N) ->
  try
      Ans = 2/N,
      Ans
  catch
      error:badarith  ->
        io:fwrite("~p\n",["Can't divide by 0"])
  end.

read_txt2() ->
  try
    {ok, File} = file:open("file.txt", [read]),
      Words = file:read(File, 1024 * 1024),
      io:fwrite("~p\n", [Words])
  catch
      _:_  ->
        io:fwrite("~p\n", ["cannot find file"])
  end.

-define(add(X,Y), {X+Y}).

macro_stuff(X,Y) ->
  io:fwrite("~p\n", [?add(X, Y)]).

get_id(M) ->
  io:fwrite("Id : ~p\n", [M]).

spawer() ->
  spawn(fun() -> get_id([self()]) end).

test_list() ->
  [Head|Tail] = [0],
  io:fwrite("~p\n", [Head]),
  io:fwrite("~p\n", [Tail]).


main() ->
  test_list().