��
�/�/
:
Add
x"T
y"T
z"T"
Ttype:
2	
x
Assign
ref"T�

value"T

output_ref"T�"	
Ttype"
validate_shapebool("
use_lockingbool(�
B
AssignVariableOp
resource
value"dtype"
dtypetype�
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
�
GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"

batch_dimsint "
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
=
Greater
x"T
y"T
z
"
Ttype:
2	
B
GreaterEqual
x"T
y"T
z
"
Ttype:
2	
�
HashTableV2
table_handle"
	containerstring "
shared_namestring "!
use_node_name_sharingbool( "
	key_dtypetype"
value_dtypetype�
V
HistogramSummary
tag
values"T
summary"
Ttype0:
2	
.
Identity

input"T
output"T"	
Ttype
?
	LessEqual
x"T
y"T
z
"
Ttype:
2	
w
LookupTableFindV2
table_handle
keys"Tin
default_value"Tout
values"Tout"
Tintype"
Touttype�
b
LookupTableImportV2
table_handle
keys"Tin
values"Tout"
Tintype"
Touttype�
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
8
Maximum
x"T
y"T
z"T"
Ttype:

2	
N
Merge
inputs"T*N
output"T
value_index"	
Ttype"
Nint(0
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(�
=
Mul
x"T
y"T
z"T"
Ttype:
2	�

NoOp
E
NotEqual
x"T
y"T
z
"
Ttype:
2	
�
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
�
ParseExample

serialized	
names
sparse_keys*Nsparse

dense_keys*Ndense
dense_defaults2Tdense
sparse_indices	*Nsparse
sparse_values2sparse_types
sparse_shapes	*Nsparse
dense_values2Tdense"
Nsparseint("
Ndenseint("%
sparse_types
list(type)(:
2	"
Tdense
list(type)(:
2	"
dense_shapeslist(shape)(
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
�
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	�
a
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:	
2	
@
ReadVariableOp
resource
value"dtype"
dtypetype�
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
�
ResourceGather
resource
indices"Tindices
output"dtype"

batch_dimsint "
validate_indicesbool("
dtypetype"
Tindicestype:
2	�
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
P
ScalarSummary
tags
values"T
summary"
Ttype:
2	
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
O
Size

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
�
SparseFillEmptyRows
indices	
values"T
dense_shape	
default_value"T
output_indices	
output_values"T
empty_row_indicator

reverse_index_map	"	
Ttype
h
SparseReshape
input_indices	
input_shape	
	new_shape	
output_indices	
output_shape	
z
SparseSegmentMean	
data"T
indices"Tidx
segment_ids
output"T"
Ttype:
2"
Tidxtype0:
2	
-
Sqrt
x"T
y"T"
Ttype:

2
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
�
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
M
Switch	
data"T
pred

output_false"T
output_true"T"	
Ttype
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
�
TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	�
P
Unique
x"T
y"T
idx"out_idx"	
Ttype"
out_idxtype0:
2	
q
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape�
9
VarIsInitializedOp
resource
is_initialized
�
s

VariableV2
ref"dtype�"
shapeshape"
dtypetype"
	containerstring "
shared_namestring �
E
Where

input"T	
index	"%
Ttype0
:
2	

&
	ZerosLike
x"T
y"T"	
Ttype"serve*1.14.02v1.14.0-rc1-22-gaf24dc91b58��

global_step/Initializer/zerosConst*
value	B	 R *
_class
loc:@global_step*
dtype0	*
_output_shapes
: 
k
global_step
VariableV2*
_class
loc:@global_step*
dtype0	*
_output_shapes
: *
shape: 
�
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
T0	*
_class
loc:@global_step*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
T0	*
_class
loc:@global_step*
_output_shapes
: 
o
input_example_tensorPlaceholder*
dtype0*#
_output_shapes
:���������*
shape:���������
U
ParseExample/ConstConst*
valueB	 *
dtype0	*
_output_shapes
: 
W
ParseExample/Const_1Const*
dtype0	*
_output_shapes
: *
valueB	 
W
ParseExample/Const_2Const*
valueB	 *
dtype0	*
_output_shapes
: 
W
ParseExample/Const_3Const*
valueB	 *
dtype0	*
_output_shapes
: 
b
ParseExample/ParseExample/namesConst*
_output_shapes
: *
valueB *
dtype0
m
'ParseExample/ParseExample/sparse_keys_0Const*
dtype0*
_output_shapes
: *
valueB Bmeals
q
'ParseExample/ParseExample/sparse_keys_1Const*
valueB B	recipe_id*
dtype0*
_output_shapes
: 
o
'ParseExample/ParseExample/sparse_keys_2Const*
_output_shapes
: *
valueB Buser_id*
dtype0
o
&ParseExample/ParseExample/dense_keys_0Const*
valueB Buser_age*
dtype0*
_output_shapes
: 
r
&ParseExample/ParseExample/dense_keys_1Const*
_output_shapes
: *
valueB Buser_gender*
dtype0
r
&ParseExample/ParseExample/dense_keys_2Const*
valueB Buser_health*
dtype0*
_output_shapes
: 
s
&ParseExample/ParseExample/dense_keys_3Const*
_output_shapes
: *
valueB Buser_hobbies*
dtype0
�
ParseExample/ParseExampleParseExampleinput_example_tensorParseExample/ParseExample/names'ParseExample/ParseExample/sparse_keys_0'ParseExample/ParseExample/sparse_keys_1'ParseExample/ParseExample/sparse_keys_2&ParseExample/ParseExample/dense_keys_0&ParseExample/ParseExample/dense_keys_1&ParseExample/ParseExample/dense_keys_2&ParseExample/ParseExample/dense_keys_3ParseExample/ConstParseExample/Const_1ParseExample/Const_2ParseExample/Const_3*
Ndense*�
_output_shapes�
�:���������:���������:���������:���������:���������:���������::::���������:���������:���������:���������*
Nsparse*
sparse_types
2			**
dense_shapes
::::*
Tdense
2				
�
vdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Initializer/truncated_normal/shapeConst*
dtype0*
_output_shapes
:*
valueB"�     *f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0
�
udnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*
valueB
 *    *f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
�
wdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*
valueB
 *  �>*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormalvdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*
T0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
:	�
�
tdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMul�dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalwdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*
_output_shapes
:	�*
T0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0
�
pdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Initializer/truncated_normalAddtdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Initializer/truncated_normal/muludnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*
_output_shapes
:	�*
T0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0
�
Sdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0VarHandleOp*
shape:	�*d
shared_nameUSdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
�
tdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpSdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*
_output_shapes
: 
�
Zdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/AssignAssignVariableOpSdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0pdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Initializer/truncated_normal*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*
dtype0
�
gdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Read/ReadVariableOpReadVariableOpSdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
:	�
�
zdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/shapeConst*
valueB"  @   *j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
:
�
ydnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*
valueB
 *    *j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
�
{dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*
_output_shapes
: *
valueB
 *   >*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
dtype0
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormalzdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
:	�@*
T0
�
xdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMul�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormal{dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*
T0*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
_output_shapes
:	�@
�
tdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Initializer/truncated_normalAddxdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulydnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*
_output_shapes
:	�@*
T0*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0
�
Wdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0VarHandleOp*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: *
shape:	�@*h
shared_nameYWdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0
�
xdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpWdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
_output_shapes
: 
�
^dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/AssignAssignVariableOpWdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0tdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Initializer/truncated_normal*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
dtype0
�
kdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Read/ReadVariableOpReadVariableOpWdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
_output_shapes
:	�@*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
dtype0
�
xdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/shapeConst*
valueB"�     *h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
:
�
wdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*
valueB
 *    *h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
�
ydnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  �>*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormalxdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
:	�*
T0
�
vdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMul�dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalydnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*
_output_shapes
:	�
�
rdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Initializer/truncated_normalAddvdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulwdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*
_output_shapes
:	�*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0
�
Udnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0VarHandleOp*f
shared_nameWUdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: *
shape:	�
�
vdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpUdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*
_output_shapes
: 
�
\dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/AssignAssignVariableOpUdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0rdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Initializer/truncated_normal*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*
dtype0
�
idnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Read/ReadVariableOpReadVariableOpUdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*
_output_shapes
:	�*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*
dtype0
� 
Mdnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/ConstConst*�
value�B��"�                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                      	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  *
dtype0*
_output_shapes	
:�
�
Ldnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/SizeConst*
value
B :�*
dtype0*
_output_shapes
: 
�
Sdnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
�
Sdnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
�
Mdnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/rangeRangeSdnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/range/startLdnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/SizeSdnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/range/delta*
_output_shapes	
:�
�
Ldnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/CastCastMdnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/range*

SrcT0*
_output_shapes	
:�*

DstT0	
�
Wdnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/hash_table/CastCastMdnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/Const*

SrcT0*
_output_shapes	
:�*

DstT0	
�
Xdnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/hash_table/ConstConst*
valueB	 R
���������*
dtype0	*
_output_shapes
: 
�
]dnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/hash_table/hash_tableHashTableV2*
	key_dtype0	*
value_dtype0	*
_output_shapes
: 
�
qdnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/hash_table/table_init/LookupTableImportV2LookupTableImportV2]dnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/hash_table/hash_tableWdnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/hash_table/CastLdnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/Cast*	
Tin0	*

Tout0	
�
^dnn/input_from_feature_columns/input_layer/meals_embedding/hash_table_Lookup/LookupTableFindV2LookupTableFindV2]dnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/hash_table/hash_tableParseExample/ParseExample:3Xdnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/hash_table/Const*#
_output_shapes
:���������*	
Tin0	*

Tout0	
�
^dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
�
]dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
�
Xdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/SliceSliceParseExample/ParseExample:6^dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Slice/begin]dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:
�
Xdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/ConstConst*
_output_shapes
:*
valueB: *
dtype0
�
Wdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/ProdProdXdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/SliceXdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Const*
_output_shapes
: *
T0	
�
cdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GatherV2/indicesConst*
dtype0*
_output_shapes
: *
value	B :
�
`dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
[dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GatherV2GatherV2ParseExample/ParseExample:6cdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GatherV2/indices`dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0	*
_output_shapes
: 
�
Ydnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Cast/xPackWdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Prod[dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GatherV2*
T0	*
N*
_output_shapes
:
�
`dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/SparseReshapeSparseReshapeParseExample/ParseExampleParseExample/ParseExample:6Ydnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Cast/x*-
_output_shapes
:���������:
�
idnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/SparseReshape/IdentityIdentity^dnn/input_from_feature_columns/input_layer/meals_embedding/hash_table_Lookup/LookupTableFindV2*
T0	*#
_output_shapes
:���������
�
adnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
�
_dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GreaterEqualGreaterEqualidnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/SparseReshape/Identityadnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
Xdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/WhereWhere_dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GreaterEqual*'
_output_shapes
:���������
�
`dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Reshape/shapeConst*
valueB:
���������*
dtype0*
_output_shapes
:
�
Zdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/ReshapeReshapeXdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Where`dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Reshape/shape*
T0	*#
_output_shapes
:���������
�
bdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GatherV2_1/axisConst*
_output_shapes
: *
value	B : *
dtype0
�
]dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GatherV2_1GatherV2`dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/SparseReshapeZdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Reshapebdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GatherV2_1/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:���������
�
bdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
]dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GatherV2_2GatherV2idnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/SparseReshape/IdentityZdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Reshapebdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GatherV2_2/axis*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:���������
�
[dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/IdentityIdentitybdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:
�
ldnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
�
zdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRows]dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GatherV2_1]dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/GatherV2_2[dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Identityldnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:���������:���������:���������:���������
�
~dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
�
xdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlicezdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows~dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/strided_slice/stack�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
shrink_axis_mask*

begin_mask*
end_mask*#
_output_shapes
:���������*
Index0*
T0	
�
odnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/CastCastxdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/strided_slice*#
_output_shapes
:���������*

DstT0*

SrcT0	
�
qdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/UniqueUnique|dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*2
_output_shapes 
:���������:���������
�
{dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookupResourceGatherSdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0qdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/Unique*
Tindices0	*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*
dtype0*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity{dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mulMul�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity*
T0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum/reduction_indicesConst*
valueB:*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
:
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SumSum�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum/reduction_indices*'
_output_shapes
:���������*
	keep_dims(*
T0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater/yConst*
valueB
 *    *f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/GreaterGreater�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater/y*'
_output_shapes
:���������*
T0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/ShapeShape�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum*
_output_shapes
:*
T0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_likeFill�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/Shape�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/Const*
T0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SelectSelect�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like*
T0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SqrtSqrt�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select*'
_output_shapes
:���������*
T0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select_1Select�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sqrt�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum*
T0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1/yConst*
valueB
 *  �@*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1Mul�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1/y*
T0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum/yConst*
dtype0*
_output_shapes
: *
valueB
 *  �@*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/MaximumMaximum�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select_1�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum/y*'
_output_shapes
:���������*
T0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/truedivRealDiv�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum*
T0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_normIdentity�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/truediv*'
_output_shapes
:���������*
T0*f
_class\
ZXloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1Identity�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm*
T0*'
_output_shapes
:���������
�
jdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparseSparseSegmentMean�dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1sdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/Unique:1odnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:���������*
T0
�
bdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
\dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Reshape_1Reshape|dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2bdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Reshape_1/shape*
T0
*'
_output_shapes
:���������
�
Xdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/ShapeShapejdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse*
T0*
_output_shapes
:
�
fdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
�
hdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
hdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
`dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/strided_sliceStridedSliceXdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Shapefdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/strided_slice/stackhdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/strided_slice/stack_1hdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/strided_slice/stack_2*
_output_shapes
: *
shrink_axis_mask*
Index0*
T0
�
Zdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
�
Xdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/stackPackZdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/stack/0`dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/strided_slice*
T0*
N*
_output_shapes
:
�
Wdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/TileTile\dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Reshape_1Xdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/stack*
T0
*0
_output_shapes
:������������������
�
]dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/zeros_like	ZerosLikejdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse*'
_output_shapes
:���������*
T0
�
Rdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weightsSelectWdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Tile]dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/zeros_likejdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
Ydnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Cast_1CastParseExample/ParseExample:6*

SrcT0	*
_output_shapes
:*

DstT0
�
`dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Slice_1/beginConst*
_output_shapes
:*
valueB: *
dtype0
�
_dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
�
Zdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Slice_1SliceYdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Cast_1`dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Slice_1/begin_dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
�
Zdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Shape_1ShapeRdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights*
_output_shapes
:*
T0
�
`dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
�
_dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
Zdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Slice_2SliceZdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Shape_1`dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Slice_2/begin_dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Slice_2/size*
Index0*
T0*
_output_shapes
:
�
^dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
Ydnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/concatConcatV2Zdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Slice_1Zdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Slice_2^dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/concat/axis*
_output_shapes
:*
T0*
N
�
\dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Reshape_2ReshapeRdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weightsYdnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/concat*
T0*'
_output_shapes
:���������
�
@dnn/input_from_feature_columns/input_layer/meals_embedding/ShapeShape\dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Reshape_2*
T0*
_output_shapes
:
�
Ndnn/input_from_feature_columns/input_layer/meals_embedding/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
Pdnn/input_from_feature_columns/input_layer/meals_embedding/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
Pdnn/input_from_feature_columns/input_layer/meals_embedding/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
Hdnn/input_from_feature_columns/input_layer/meals_embedding/strided_sliceStridedSlice@dnn/input_from_feature_columns/input_layer/meals_embedding/ShapeNdnn/input_from_feature_columns/input_layer/meals_embedding/strided_slice/stackPdnn/input_from_feature_columns/input_layer/meals_embedding/strided_slice/stack_1Pdnn/input_from_feature_columns/input_layer/meals_embedding/strided_slice/stack_2*
_output_shapes
: *
shrink_axis_mask*
Index0*
T0
�
Jdnn/input_from_feature_columns/input_layer/meals_embedding/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
�
Hdnn/input_from_feature_columns/input_layer/meals_embedding/Reshape/shapePackHdnn/input_from_feature_columns/input_layer/meals_embedding/strided_sliceJdnn/input_from_feature_columns/input_layer/meals_embedding/Reshape/shape/1*
T0*
N*
_output_shapes
:
�
Bdnn/input_from_feature_columns/input_layer/meals_embedding/ReshapeReshape\dnn/input_from_feature_columns/input_layer/meals_embedding/meals_embedding_weights/Reshape_2Hdnn/input_from_feature_columns/input_layer/meals_embedding/Reshape/shape*
T0*'
_output_shapes
:���������
�j
Udnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/ConstConst*
_output_shapes	
:�*�i
value�hB�h�"�h                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                      	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �   	  	  	  	  	  	  	  	  	  		  
	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	   	  !	  "	  #	  $	  %	  &	  '	  (	  )	  *	  +	  ,	  -	  .	  /	  0	  1	  2	  3	  4	  5	  6	  7	  8	  9	  :	  ;	  <	  =	  >	  ?	  @	  A	  B	  C	  D	  E	  F	  G	  H	  I	  J	  K	  L	  M	  N	  O	  P	  Q	  R	  S	  T	  U	  V	  W	  X	  Y	  Z	  [	  \	  ]	  ^	  _	  `	  a	  b	  c	  d	  e	  f	  g	  h	  i	  j	  k	  l	  m	  n	  o	  p	  q	  r	  s	  t	  u	  v	  w	  x	  y	  z	  {	  |	  }	  ~	  	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	   
  
  
  
  
  
  
  
  
  	
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   
  !
  "
  #
  $
  %
  &
  '
  (
  )
  *
  +
  ,
  -
  .
  /
  0
  1
  2
  3
  4
  5
  6
  7
  8
  9
  :
  ;
  <
  =
  >
  ?
  @
  A
  B
  C
  D
  E
  F
  G
  H
  I
  J
  K
  L
  M
  N
  O
  P
  Q
  R
  S
  T
  U
  V
  W
  X
  Y
  Z
  [
  \
  ]
  ^
  _
  `
  a
  b
  c
  d
  e
  f
  g
  h
  i
  j
  k
  l
  m
  n
  o
  p
  q
  r
  s
  t
  u
  v
  w
  x
  y
  z
  {
  |
  }
  ~
  
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                *
dtype0
�
Tdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/SizeConst*
value
B :�*
dtype0*
_output_shapes
: 
�
[dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
[dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
Udnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/rangeRange[dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/range/startTdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/Size[dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/range/delta*
_output_shapes	
:�
�
Tdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/CastCastUdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/range*
_output_shapes	
:�*

DstT0	*

SrcT0
�
_dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/hash_table/CastCastUdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/Const*
_output_shapes	
:�*

DstT0	*

SrcT0
�
`dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/hash_table/ConstConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
ednn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/hash_table/hash_tableHashTableV2*
	key_dtype0	*
value_dtype0	*
_output_shapes
: 
�
ydnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/hash_table/table_init/LookupTableImportV2LookupTableImportV2ednn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/hash_table/hash_table_dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/hash_table/CastTdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/Cast*

Tout0	*	
Tin0	
�
bdnn/input_from_feature_columns/input_layer/recipe_id_embedding/hash_table_Lookup/LookupTableFindV2LookupTableFindV2ednn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/hash_table/hash_tableParseExample/ParseExample:4`dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/hash_table/Const*#
_output_shapes
:���������*	
Tin0	*

Tout0	
�
fdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
�
ednn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
�
`dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/SliceSliceParseExample/ParseExample:7fdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice/beginednn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice/size*
_output_shapes
:*
Index0*
T0	
�
`dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/ConstConst*
valueB: *
dtype0*
_output_shapes
:
�
_dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/ProdProd`dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice`dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Const*
T0	*
_output_shapes
: 
�
kdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
�
hdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
cdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GatherV2GatherV2ParseExample/ParseExample:7kdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GatherV2/indiceshdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GatherV2/axis*
Tindices0*
Tparams0	*
_output_shapes
: *
Taxis0
�
adnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Cast/xPack_dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Prodcdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GatherV2*
N*
_output_shapes
:*
T0	
�
hdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/SparseReshapeSparseReshapeParseExample/ParseExample:1ParseExample/ParseExample:7adnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Cast/x*-
_output_shapes
:���������:
�
qdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/SparseReshape/IdentityIdentitybdnn/input_from_feature_columns/input_layer/recipe_id_embedding/hash_table_Lookup/LookupTableFindV2*
T0	*#
_output_shapes
:���������
�
idnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
�
gdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GreaterEqualGreaterEqualqdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/SparseReshape/Identityidnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
`dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/WhereWheregdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GreaterEqual*'
_output_shapes
:���������
�
hdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Reshape/shapeConst*
valueB:
���������*
dtype0*
_output_shapes
:
�
bdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/ReshapeReshape`dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Wherehdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Reshape/shape*#
_output_shapes
:���������*
T0	
�
jdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
ednn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GatherV2_1GatherV2hdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/SparseReshapebdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Reshapejdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GatherV2_1/axis*'
_output_shapes
:���������*
Taxis0*
Tindices0	*
Tparams0	
�
jdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
ednn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GatherV2_2GatherV2qdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/SparseReshape/Identitybdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Reshapejdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GatherV2_2/axis*#
_output_shapes
:���������*
Taxis0*
Tindices0	*
Tparams0	
�
cdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/IdentityIdentityjdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/SparseReshape:1*
_output_shapes
:*
T0	
�
tdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/SparseFillEmptyRows/ConstConst*
_output_shapes
: *
value	B	 R *
dtype0	
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsednn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GatherV2_1ednn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/GatherV2_2cdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Identitytdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/SparseFillEmptyRows/Const*T
_output_shapesB
@:���������:���������:���������:���������*
T0	
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*#
_output_shapes
:���������*
Index0*
T0	*
shrink_axis_mask*

begin_mask
�
wdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/CastCast�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:���������*

DstT0
�
ydnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/UniqueUnique�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*2
_output_shapes 
:���������:���������*
T0	
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookupResourceGatherWdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0ydnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/Unique*
dtype0*'
_output_shapes
:���������@*
Tindices0	*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*'
_output_shapes
:���������@
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mulMul�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity*
T0*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*'
_output_shapes
:���������@
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum/reduction_indicesConst*
valueB:*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
:
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SumSum�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum/reduction_indices*'
_output_shapes
:���������*
	keep_dims(*
T0*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater/yConst*
valueB
 *    *j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/GreaterGreater�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater/y*
T0*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/ShapeShape�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum*
T0*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
_output_shapes
:
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/ConstConst*
valueB
 *  �?*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_likeFill�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/Shape�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/Const*'
_output_shapes
:���������*
T0*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SelectSelect�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like*'
_output_shapes
:���������*
T0*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SqrtSqrt�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*'
_output_shapes
:���������*
T0
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select_1Select�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sqrt�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum*
T0*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1/yConst*
valueB
 *   A*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1Mul�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1/y*
T0*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*'
_output_shapes
:���������@
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum/yConst*
_output_shapes
: *
valueB
 *   A*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
dtype0
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/MaximumMaximum�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select_1�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum/y*
T0*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/truedivRealDiv�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum*
T0*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*'
_output_shapes
:���������@
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_normIdentity�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/truediv*
T0*j
_class`
^\loc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*'
_output_shapes
:���������@
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1Identity�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm*
T0*'
_output_shapes
:���������@
�
rdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparseSparseSegmentMean�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1{dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/Unique:1wdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:���������@*
T0
�
jdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Reshape_1/shapeConst*
valueB"����   *
dtype0*
_output_shapes
:
�
ddnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Reshape_1Reshape�dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2jdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Reshape_1/shape*'
_output_shapes
:���������*
T0

�
`dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/ShapeShaperdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse*
T0*
_output_shapes
:
�
ndnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
�
pdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
pdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
hdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/strided_sliceStridedSlice`dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Shapendnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/strided_slice/stackpdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/strided_slice/stack_1pdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/strided_slice/stack_2*
_output_shapes
: *
shrink_axis_mask*
T0*
Index0
�
bdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/stack/0Const*
_output_shapes
: *
value	B :*
dtype0
�
`dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/stackPackbdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/stack/0hdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/strided_slice*
T0*
N*
_output_shapes
:
�
_dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/TileTileddnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Reshape_1`dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/stack*
T0
*0
_output_shapes
:������������������
�
ednn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/zeros_like	ZerosLikerdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������@
�
Zdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weightsSelect_dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Tileednn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/zeros_likerdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������@
�
adnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Cast_1CastParseExample/ParseExample:7*
_output_shapes
:*

DstT0*

SrcT0	
�
hdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:
�
gdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
�
bdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice_1Sliceadnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Cast_1hdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice_1/begingdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
�
bdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Shape_1ShapeZdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights*
_output_shapes
:*
T0
�
hdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
�
gdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice_2/sizeConst*
valueB:
���������*
dtype0*
_output_shapes
:
�
bdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice_2Slicebdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Shape_1hdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice_2/begingdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice_2/size*
Index0*
T0*
_output_shapes
:
�
fdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
adnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/concatConcatV2bdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice_1bdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Slice_2fdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/concat/axis*
T0*
N*
_output_shapes
:
�
ddnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Reshape_2ReshapeZdnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weightsadnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/concat*
T0*'
_output_shapes
:���������@
�
Ddnn/input_from_feature_columns/input_layer/recipe_id_embedding/ShapeShapeddnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Reshape_2*
T0*
_output_shapes
:
�
Rdnn/input_from_feature_columns/input_layer/recipe_id_embedding/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
Tdnn/input_from_feature_columns/input_layer/recipe_id_embedding/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
Tdnn/input_from_feature_columns/input_layer/recipe_id_embedding/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
Ldnn/input_from_feature_columns/input_layer/recipe_id_embedding/strided_sliceStridedSliceDdnn/input_from_feature_columns/input_layer/recipe_id_embedding/ShapeRdnn/input_from_feature_columns/input_layer/recipe_id_embedding/strided_slice/stackTdnn/input_from_feature_columns/input_layer/recipe_id_embedding/strided_slice/stack_1Tdnn/input_from_feature_columns/input_layer/recipe_id_embedding/strided_slice/stack_2*
_output_shapes
: *
shrink_axis_mask*
Index0*
T0
�
Ndnn/input_from_feature_columns/input_layer/recipe_id_embedding/Reshape/shape/1Const*
value	B :@*
dtype0*
_output_shapes
: 
�
Ldnn/input_from_feature_columns/input_layer/recipe_id_embedding/Reshape/shapePackLdnn/input_from_feature_columns/input_layer/recipe_id_embedding/strided_sliceNdnn/input_from_feature_columns/input_layer/recipe_id_embedding/Reshape/shape/1*
N*
_output_shapes
:*
T0
�
Fdnn/input_from_feature_columns/input_layer/recipe_id_embedding/ReshapeReshapeddnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_embedding_weights/Reshape_2Ldnn/input_from_feature_columns/input_layer/recipe_id_embedding/Reshape/shape*'
_output_shapes
:���������@*
T0
�
8dnn/input_from_feature_columns/input_layer/user_age/CastCastParseExample/ParseExample:9*

SrcT0	*'
_output_shapes
:���������*

DstT0
�
9dnn/input_from_feature_columns/input_layer/user_age/ShapeShape8dnn/input_from_feature_columns/input_layer/user_age/Cast*
_output_shapes
:*
T0
�
Gdnn/input_from_feature_columns/input_layer/user_age/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
Idnn/input_from_feature_columns/input_layer/user_age/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
Idnn/input_from_feature_columns/input_layer/user_age/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
Adnn/input_from_feature_columns/input_layer/user_age/strided_sliceStridedSlice9dnn/input_from_feature_columns/input_layer/user_age/ShapeGdnn/input_from_feature_columns/input_layer/user_age/strided_slice/stackIdnn/input_from_feature_columns/input_layer/user_age/strided_slice/stack_1Idnn/input_from_feature_columns/input_layer/user_age/strided_slice/stack_2*
_output_shapes
: *
shrink_axis_mask*
T0*
Index0
�
Cdnn/input_from_feature_columns/input_layer/user_age/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
�
Adnn/input_from_feature_columns/input_layer/user_age/Reshape/shapePackAdnn/input_from_feature_columns/input_layer/user_age/strided_sliceCdnn/input_from_feature_columns/input_layer/user_age/Reshape/shape/1*
T0*
N*
_output_shapes
:
�
;dnn/input_from_feature_columns/input_layer/user_age/ReshapeReshape8dnn/input_from_feature_columns/input_layer/user_age/CastAdnn/input_from_feature_columns/input_layer/user_age/Reshape/shape*
T0*'
_output_shapes
:���������
�
;dnn/input_from_feature_columns/input_layer/user_gender/CastCastParseExample/ParseExample:10*

SrcT0	*'
_output_shapes
:���������*

DstT0
�
<dnn/input_from_feature_columns/input_layer/user_gender/ShapeShape;dnn/input_from_feature_columns/input_layer/user_gender/Cast*
T0*
_output_shapes
:
�
Jdnn/input_from_feature_columns/input_layer/user_gender/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
Ldnn/input_from_feature_columns/input_layer/user_gender/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
Ldnn/input_from_feature_columns/input_layer/user_gender/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
Ddnn/input_from_feature_columns/input_layer/user_gender/strided_sliceStridedSlice<dnn/input_from_feature_columns/input_layer/user_gender/ShapeJdnn/input_from_feature_columns/input_layer/user_gender/strided_slice/stackLdnn/input_from_feature_columns/input_layer/user_gender/strided_slice/stack_1Ldnn/input_from_feature_columns/input_layer/user_gender/strided_slice/stack_2*
shrink_axis_mask*
T0*
Index0*
_output_shapes
: 
�
Fdnn/input_from_feature_columns/input_layer/user_gender/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
�
Ddnn/input_from_feature_columns/input_layer/user_gender/Reshape/shapePackDdnn/input_from_feature_columns/input_layer/user_gender/strided_sliceFdnn/input_from_feature_columns/input_layer/user_gender/Reshape/shape/1*
_output_shapes
:*
T0*
N
�
>dnn/input_from_feature_columns/input_layer/user_gender/ReshapeReshape;dnn/input_from_feature_columns/input_layer/user_gender/CastDdnn/input_from_feature_columns/input_layer/user_gender/Reshape/shape*'
_output_shapes
:���������*
T0
�
;dnn/input_from_feature_columns/input_layer/user_health/CastCastParseExample/ParseExample:11*

SrcT0	*'
_output_shapes
:���������*

DstT0
�
<dnn/input_from_feature_columns/input_layer/user_health/ShapeShape;dnn/input_from_feature_columns/input_layer/user_health/Cast*
T0*
_output_shapes
:
�
Jdnn/input_from_feature_columns/input_layer/user_health/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
Ldnn/input_from_feature_columns/input_layer/user_health/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
Ldnn/input_from_feature_columns/input_layer/user_health/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
Ddnn/input_from_feature_columns/input_layer/user_health/strided_sliceStridedSlice<dnn/input_from_feature_columns/input_layer/user_health/ShapeJdnn/input_from_feature_columns/input_layer/user_health/strided_slice/stackLdnn/input_from_feature_columns/input_layer/user_health/strided_slice/stack_1Ldnn/input_from_feature_columns/input_layer/user_health/strided_slice/stack_2*
shrink_axis_mask*
T0*
Index0*
_output_shapes
: 
�
Fdnn/input_from_feature_columns/input_layer/user_health/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
�
Ddnn/input_from_feature_columns/input_layer/user_health/Reshape/shapePackDdnn/input_from_feature_columns/input_layer/user_health/strided_sliceFdnn/input_from_feature_columns/input_layer/user_health/Reshape/shape/1*
T0*
N*
_output_shapes
:
�
>dnn/input_from_feature_columns/input_layer/user_health/ReshapeReshape;dnn/input_from_feature_columns/input_layer/user_health/CastDdnn/input_from_feature_columns/input_layer/user_health/Reshape/shape*
T0*'
_output_shapes
:���������
�
<dnn/input_from_feature_columns/input_layer/user_hobbies/CastCastParseExample/ParseExample:12*

SrcT0	*'
_output_shapes
:���������*

DstT0
�
=dnn/input_from_feature_columns/input_layer/user_hobbies/ShapeShape<dnn/input_from_feature_columns/input_layer/user_hobbies/Cast*
T0*
_output_shapes
:
�
Kdnn/input_from_feature_columns/input_layer/user_hobbies/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
Mdnn/input_from_feature_columns/input_layer/user_hobbies/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
Mdnn/input_from_feature_columns/input_layer/user_hobbies/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
Ednn/input_from_feature_columns/input_layer/user_hobbies/strided_sliceStridedSlice=dnn/input_from_feature_columns/input_layer/user_hobbies/ShapeKdnn/input_from_feature_columns/input_layer/user_hobbies/strided_slice/stackMdnn/input_from_feature_columns/input_layer/user_hobbies/strided_slice/stack_1Mdnn/input_from_feature_columns/input_layer/user_hobbies/strided_slice/stack_2*
T0*
Index0*
_output_shapes
: *
shrink_axis_mask
�
Gdnn/input_from_feature_columns/input_layer/user_hobbies/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
�
Ednn/input_from_feature_columns/input_layer/user_hobbies/Reshape/shapePackEdnn/input_from_feature_columns/input_layer/user_hobbies/strided_sliceGdnn/input_from_feature_columns/input_layer/user_hobbies/Reshape/shape/1*
T0*
N*
_output_shapes
:
�
?dnn/input_from_feature_columns/input_layer/user_hobbies/ReshapeReshape<dnn/input_from_feature_columns/input_layer/user_hobbies/CastEdnn/input_from_feature_columns/input_layer/user_hobbies/Reshape/shape*
T0*'
_output_shapes
:���������
� 
Qdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/ConstConst*�
value�B��"�                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                      	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  *
dtype0*
_output_shapes	
:�
�
Pdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/SizeConst*
value
B :�*
dtype0*
_output_shapes
: 
�
Wdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
�
Wdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
�
Qdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/rangeRangeWdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/range/startPdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/SizeWdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/range/delta*
_output_shapes	
:�
�
Pdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/CastCastQdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/range*

SrcT0*
_output_shapes	
:�*

DstT0	
�
[dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/hash_table/CastCastQdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/Const*

SrcT0*
_output_shapes	
:�*

DstT0	
�
\dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/hash_table/ConstConst*
valueB	 R
���������*
dtype0	*
_output_shapes
: 
�
adnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/hash_table/hash_tableHashTableV2*
value_dtype0	*
	key_dtype0	*
_output_shapes
: 
�
udnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/hash_table/table_init/LookupTableImportV2LookupTableImportV2adnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/hash_table/hash_table[dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/hash_table/CastPdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/Cast*	
Tin0	*

Tout0	
�
`dnn/input_from_feature_columns/input_layer/user_id_embedding/hash_table_Lookup/LookupTableFindV2LookupTableFindV2adnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/hash_table/hash_tableParseExample/ParseExample:5\dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/hash_table/Const*

Tout0	*#
_output_shapes
:���������*	
Tin0	
�
bdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
�
adnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
�
\dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/SliceSliceParseExample/ParseExample:8bdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice/beginadnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:
�
\dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/ConstConst*
_output_shapes
:*
valueB: *
dtype0
�
[dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/ProdProd\dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice\dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Const*
T0	*
_output_shapes
: 
�
gdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GatherV2/indicesConst*
dtype0*
_output_shapes
: *
value	B :
�
ddnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
_dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GatherV2GatherV2ParseExample/ParseExample:8gdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GatherV2/indicesddnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GatherV2/axis*
_output_shapes
: *
Taxis0*
Tindices0*
Tparams0	
�
]dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Cast/xPack[dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Prod_dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GatherV2*
T0	*
N*
_output_shapes
:
�
ddnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/SparseReshapeSparseReshapeParseExample/ParseExample:2ParseExample/ParseExample:8]dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Cast/x*-
_output_shapes
:���������:
�
mdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/SparseReshape/IdentityIdentity`dnn/input_from_feature_columns/input_layer/user_id_embedding/hash_table_Lookup/LookupTableFindV2*
T0	*#
_output_shapes
:���������
�
ednn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
�
cdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GreaterEqualGreaterEqualmdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/SparseReshape/Identityednn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GreaterEqual/y*#
_output_shapes
:���������*
T0	
�
\dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/WhereWherecdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GreaterEqual*'
_output_shapes
:���������
�
ddnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Reshape/shapeConst*
valueB:
���������*
dtype0*
_output_shapes
:
�
^dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/ReshapeReshape\dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Whereddnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Reshape/shape*
T0	*#
_output_shapes
:���������
�
fdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
adnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GatherV2_1GatherV2ddnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/SparseReshape^dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Reshapefdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GatherV2_1/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:���������
�
fdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
adnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GatherV2_2GatherV2mdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/SparseReshape/Identity^dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Reshapefdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GatherV2_2/axis*#
_output_shapes
:���������*
Taxis0*
Tindices0	*
Tparams0	
�
_dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/IdentityIdentityfdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:
�
pdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
~dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsadnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GatherV2_1adnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/GatherV2_2_dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Identitypdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:���������:���������:���������:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
�
|dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice~dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*

begin_mask*
end_mask*#
_output_shapes
:���������*
T0	*
Index0*
shrink_axis_mask
�
sdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/CastCast|dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/strided_slice*#
_output_shapes
:���������*

DstT0*

SrcT0	
�
udnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/UniqueUnique�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*2
_output_shapes 
:���������:���������*
T0	
�
dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookupResourceGatherUdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0udnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/Unique*
dtype0*'
_output_shapes
:���������*
Tindices0	*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentitydnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup*'
_output_shapes
:���������*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mulMul�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity*'
_output_shapes
:���������*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum/reduction_indicesConst*
_output_shapes
:*
valueB:*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*
dtype0
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SumSum�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum/reduction_indices*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*'
_output_shapes
:���������*
	keep_dims(
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater/yConst*
_output_shapes
: *
valueB
 *    *h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*
dtype0
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/GreaterGreater�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater/y*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/ShapeShape�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*
_output_shapes
:
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/ConstConst*
valueB
 *  �?*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_likeFill�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/Shape�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/Const*'
_output_shapes
:���������*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SelectSelect�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SqrtSqrt�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select*'
_output_shapes
:���������*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select_1Select�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sqrt�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1/yConst*
valueB
 *  �@*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1Mul�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1/y*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum/yConst*
valueB
 *  �@*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/MaximumMaximum�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select_1�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum/y*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*'
_output_shapes
:���������*
T0
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/truedivRealDiv�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_normIdentity�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/truediv*'
_output_shapes
:���������*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1Identity�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm*'
_output_shapes
:���������*
T0
�
ndnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparseSparseSegmentMean�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1wdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/Unique:1sdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:���������
�
fdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Reshape_1/shapeConst*
valueB"����   *
dtype0*
_output_shapes
:
�
`dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Reshape_1Reshape�dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2fdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Reshape_1/shape*'
_output_shapes
:���������*
T0

�
\dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/ShapeShapendnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse*
T0*
_output_shapes
:
�
jdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
�
ldnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
ldnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
ddnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/strided_sliceStridedSlice\dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Shapejdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/strided_slice/stackldnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/strided_slice/stack_1ldnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/strided_slice/stack_2*
_output_shapes
: *
shrink_axis_mask*
Index0*
T0
�
^dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
�
\dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/stackPack^dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/stack/0ddnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/strided_slice*
T0*
N*
_output_shapes
:
�
[dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/TileTile`dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Reshape_1\dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/stack*0
_output_shapes
:������������������*
T0

�
adnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/zeros_like	ZerosLikendnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
Vdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weightsSelect[dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Tileadnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/zeros_likendnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
]dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Cast_1CastParseExample/ParseExample:8*
_output_shapes
:*

DstT0*

SrcT0	
�
ddnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice_1/beginConst*
_output_shapes
:*
valueB: *
dtype0
�
cdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
�
^dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice_1Slice]dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Cast_1ddnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice_1/begincdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice_1/size*
_output_shapes
:*
Index0*
T0
�
^dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Shape_1ShapeVdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights*
_output_shapes
:*
T0
�
ddnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
�
cdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
^dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice_2Slice^dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Shape_1ddnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice_2/begincdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice_2/size*
Index0*
T0*
_output_shapes
:
�
bdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
�
]dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/concatConcatV2^dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice_1^dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Slice_2bdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/concat/axis*
T0*
N*
_output_shapes
:
�
`dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Reshape_2ReshapeVdnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights]dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/concat*'
_output_shapes
:���������*
T0
�
Bdnn/input_from_feature_columns/input_layer/user_id_embedding/ShapeShape`dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Reshape_2*
T0*
_output_shapes
:
�
Pdnn/input_from_feature_columns/input_layer/user_id_embedding/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
Rdnn/input_from_feature_columns/input_layer/user_id_embedding/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
Rdnn/input_from_feature_columns/input_layer/user_id_embedding/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
Jdnn/input_from_feature_columns/input_layer/user_id_embedding/strided_sliceStridedSliceBdnn/input_from_feature_columns/input_layer/user_id_embedding/ShapePdnn/input_from_feature_columns/input_layer/user_id_embedding/strided_slice/stackRdnn/input_from_feature_columns/input_layer/user_id_embedding/strided_slice/stack_1Rdnn/input_from_feature_columns/input_layer/user_id_embedding/strided_slice/stack_2*
shrink_axis_mask*
Index0*
T0*
_output_shapes
: 
�
Ldnn/input_from_feature_columns/input_layer/user_id_embedding/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
�
Jdnn/input_from_feature_columns/input_layer/user_id_embedding/Reshape/shapePackJdnn/input_from_feature_columns/input_layer/user_id_embedding/strided_sliceLdnn/input_from_feature_columns/input_layer/user_id_embedding/Reshape/shape/1*
_output_shapes
:*
T0*
N
�
Ddnn/input_from_feature_columns/input_layer/user_id_embedding/ReshapeReshape`dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_embedding_weights/Reshape_2Jdnn/input_from_feature_columns/input_layer/user_id_embedding/Reshape/shape*'
_output_shapes
:���������*
T0
�
6dnn/input_from_feature_columns/input_layer/concat/axisConst*
valueB :
���������*
dtype0*
_output_shapes
: 
�
1dnn/input_from_feature_columns/input_layer/concatConcatV2Bdnn/input_from_feature_columns/input_layer/meals_embedding/ReshapeFdnn/input_from_feature_columns/input_layer/recipe_id_embedding/Reshape;dnn/input_from_feature_columns/input_layer/user_age/Reshape>dnn/input_from_feature_columns/input_layer/user_gender/Reshape>dnn/input_from_feature_columns/input_layer/user_health/Reshape?dnn/input_from_feature_columns/input_layer/user_hobbies/ReshapeDdnn/input_from_feature_columns/input_layer/user_id_embedding/Reshape6dnn/input_from_feature_columns/input_layer/concat/axis*
T0*
N*'
_output_shapes
:���������z
�
@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shapeConst*
valueB"z      *2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
:
�
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/minConst*
valueB
 *
�*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
: 
�
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *
>*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
: 
�
Hdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shape*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
:	z�
�
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
�
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/sub*
_output_shapes
:	z�*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0
�
:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
_output_shapes
:	z�*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0
�
dnn/hiddenlayer_0/kernel/part_0VarHandleOp*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
: *
shape:	z�*0
shared_name!dnn/hiddenlayer_0/kernel/part_0
�
@dnn/hiddenlayer_0/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
�
&dnn/hiddenlayer_0/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_0/kernel/part_0:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0
�
3dnn/hiddenlayer_0/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
:	z�
�
/dnn/hiddenlayer_0/bias/part_0/Initializer/zerosConst*
valueB�*    *0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes	
:�
�
dnn/hiddenlayer_0/bias/part_0VarHandleOp*
shape:�*.
shared_namednn/hiddenlayer_0/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
: 
�
>dnn/hiddenlayer_0/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/bias/part_0*
_output_shapes
: 
�
$dnn/hiddenlayer_0/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_0/bias/part_0/dnn/hiddenlayer_0/bias/part_0/Initializer/zeros*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0
�
1dnn/hiddenlayer_0/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes	
:�
�
'dnn/hiddenlayer_0/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
:	z�
w
dnn/hiddenlayer_0/kernelIdentity'dnn/hiddenlayer_0/kernel/ReadVariableOp*
T0*
_output_shapes
:	z�
�
dnn/hiddenlayer_0/MatMulMatMul1dnn/input_from_feature_columns/input_layer/concatdnn/hiddenlayer_0/kernel*
T0*(
_output_shapes
:����������
�
%dnn/hiddenlayer_0/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes	
:�
o
dnn/hiddenlayer_0/biasIdentity%dnn/hiddenlayer_0/bias/ReadVariableOp*
T0*
_output_shapes	
:�
�
dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/bias*
T0*(
_output_shapes
:����������
r
dnn/hiddenlayer_0/SigmoidSigmoiddnn/hiddenlayer_0/BiasAdd*
T0*(
_output_shapes
:����������
j
dnn/zero_fraction/SizeSizednn/hiddenlayer_0/Sigmoid*
_output_shapes
: *
T0*
out_type0	
c
dnn/zero_fraction/LessEqual/yConst*
valueB	 R����*
dtype0	*
_output_shapes
: 
�
dnn/zero_fraction/LessEqual	LessEqualdnn/zero_fraction/Sizednn/zero_fraction/LessEqual/y*
T0	*
_output_shapes
: 
�
dnn/zero_fraction/cond/SwitchSwitchdnn/zero_fraction/LessEqualdnn/zero_fraction/LessEqual*
_output_shapes
: : *
T0

m
dnn/zero_fraction/cond/switch_tIdentitydnn/zero_fraction/cond/Switch:1*
T0
*
_output_shapes
: 
k
dnn/zero_fraction/cond/switch_fIdentitydnn/zero_fraction/cond/Switch*
T0
*
_output_shapes
: 
h
dnn/zero_fraction/cond/pred_idIdentitydnn/zero_fraction/LessEqual*
T0
*
_output_shapes
: 
�
*dnn/zero_fraction/cond/count_nonzero/zerosConst ^dnn/zero_fraction/cond/switch_t*
_output_shapes
: *
valueB
 *    *
dtype0
�
-dnn/zero_fraction/cond/count_nonzero/NotEqualNotEqual6dnn/zero_fraction/cond/count_nonzero/NotEqual/Switch:1*dnn/zero_fraction/cond/count_nonzero/zeros*(
_output_shapes
:����������*
T0
�
4dnn/zero_fraction/cond/count_nonzero/NotEqual/SwitchSwitchdnn/hiddenlayer_0/Sigmoiddnn/zero_fraction/cond/pred_id*<
_output_shapes*
(:����������:����������*
T0*,
_class"
 loc:@dnn/hiddenlayer_0/Sigmoid
�
)dnn/zero_fraction/cond/count_nonzero/CastCast-dnn/zero_fraction/cond/count_nonzero/NotEqual*(
_output_shapes
:����������*

DstT0*

SrcT0

�
*dnn/zero_fraction/cond/count_nonzero/ConstConst ^dnn/zero_fraction/cond/switch_t*
valueB"       *
dtype0*
_output_shapes
:
�
2dnn/zero_fraction/cond/count_nonzero/nonzero_countSum)dnn/zero_fraction/cond/count_nonzero/Cast*dnn/zero_fraction/cond/count_nonzero/Const*
T0*
_output_shapes
: 
�
dnn/zero_fraction/cond/CastCast2dnn/zero_fraction/cond/count_nonzero/nonzero_count*
_output_shapes
: *

DstT0	*

SrcT0
�
,dnn/zero_fraction/cond/count_nonzero_1/zerosConst ^dnn/zero_fraction/cond/switch_f*
valueB
 *    *
dtype0*
_output_shapes
: 
�
/dnn/zero_fraction/cond/count_nonzero_1/NotEqualNotEqual6dnn/zero_fraction/cond/count_nonzero_1/NotEqual/Switch,dnn/zero_fraction/cond/count_nonzero_1/zeros*
T0*(
_output_shapes
:����������
�
6dnn/zero_fraction/cond/count_nonzero_1/NotEqual/SwitchSwitchdnn/hiddenlayer_0/Sigmoiddnn/zero_fraction/cond/pred_id*,
_class"
 loc:@dnn/hiddenlayer_0/Sigmoid*<
_output_shapes*
(:����������:����������*
T0
�
+dnn/zero_fraction/cond/count_nonzero_1/CastCast/dnn/zero_fraction/cond/count_nonzero_1/NotEqual*

SrcT0
*(
_output_shapes
:����������*

DstT0	
�
,dnn/zero_fraction/cond/count_nonzero_1/ConstConst ^dnn/zero_fraction/cond/switch_f*
valueB"       *
dtype0*
_output_shapes
:
�
4dnn/zero_fraction/cond/count_nonzero_1/nonzero_countSum+dnn/zero_fraction/cond/count_nonzero_1/Cast,dnn/zero_fraction/cond/count_nonzero_1/Const*
T0	*
_output_shapes
: 
�
dnn/zero_fraction/cond/MergeMerge4dnn/zero_fraction/cond/count_nonzero_1/nonzero_countdnn/zero_fraction/cond/Cast*
N*
_output_shapes
: : *
T0	
�
(dnn/zero_fraction/counts_to_fraction/subSubdnn/zero_fraction/Sizednn/zero_fraction/cond/Merge*
_output_shapes
: *
T0	
�
)dnn/zero_fraction/counts_to_fraction/CastCast(dnn/zero_fraction/counts_to_fraction/sub*

SrcT0	*
_output_shapes
: *

DstT0
{
+dnn/zero_fraction/counts_to_fraction/Cast_1Castdnn/zero_fraction/Size*
_output_shapes
: *

DstT0*

SrcT0	
�
,dnn/zero_fraction/counts_to_fraction/truedivRealDiv)dnn/zero_fraction/counts_to_fraction/Cast+dnn/zero_fraction/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
u
dnn/zero_fraction/fractionIdentity,dnn/zero_fraction/counts_to_fraction/truediv*
T0*
_output_shapes
: 
�
2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_0/fraction_of_zero_values*
dtype0*
_output_shapes
: 
�
-dnn/dnn/hiddenlayer_0/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsdnn/zero_fraction/fraction*
_output_shapes
: *
T0
�
$dnn/dnn/hiddenlayer_0/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_0/activation*
dtype0*
_output_shapes
: 
�
 dnn/dnn/hiddenlayer_0/activationHistogramSummary$dnn/dnn/hiddenlayer_0/activation/tagdnn/hiddenlayer_0/Sigmoid*
_output_shapes
: 
�
@dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/shapeConst*
valueB"      *2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
:
�
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/minConst*
valueB
 *׳ݽ*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
: 
�
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *׳�=*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
: 
�
Hdnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/shape*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0* 
_output_shapes
:
��*
T0
�
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 
�
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0* 
_output_shapes
:
��
�
:dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0* 
_output_shapes
:
��
�
dnn/hiddenlayer_1/kernel/part_0VarHandleOp*
dtype0*
_output_shapes
: *
shape:
��*0
shared_name!dnn/hiddenlayer_1/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0
�
@dnn/hiddenlayer_1/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 
�
&dnn/hiddenlayer_1/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_1/kernel/part_0:dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0
�
3dnn/hiddenlayer_1/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0* 
_output_shapes
:
��
�
/dnn/hiddenlayer_1/bias/part_0/Initializer/zerosConst*
dtype0*
_output_shapes	
:�*
valueB�*    *0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0
�
dnn/hiddenlayer_1/bias/part_0VarHandleOp*
dtype0*
_output_shapes
: *
shape:�*.
shared_namednn/hiddenlayer_1/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0
�
>dnn/hiddenlayer_1/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_1/bias/part_0*
_output_shapes
: 
�
$dnn/hiddenlayer_1/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_1/bias/part_0/dnn/hiddenlayer_1/bias/part_0/Initializer/zeros*
dtype0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0
�
1dnn/hiddenlayer_1/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes	
:�
�
'dnn/hiddenlayer_1/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*
dtype0* 
_output_shapes
:
��
x
dnn/hiddenlayer_1/kernelIdentity'dnn/hiddenlayer_1/kernel/ReadVariableOp*
T0* 
_output_shapes
:
��
�
dnn/hiddenlayer_1/MatMulMatMuldnn/hiddenlayer_0/Sigmoiddnn/hiddenlayer_1/kernel*
T0*(
_output_shapes
:����������
�
%dnn/hiddenlayer_1/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*
_output_shapes	
:�*
dtype0
o
dnn/hiddenlayer_1/biasIdentity%dnn/hiddenlayer_1/bias/ReadVariableOp*
_output_shapes	
:�*
T0
�
dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMuldnn/hiddenlayer_1/bias*
T0*(
_output_shapes
:����������
r
dnn/hiddenlayer_1/SigmoidSigmoiddnn/hiddenlayer_1/BiasAdd*(
_output_shapes
:����������*
T0
l
dnn/zero_fraction_1/SizeSizednn/hiddenlayer_1/Sigmoid*
out_type0	*
_output_shapes
: *
T0
e
dnn/zero_fraction_1/LessEqual/yConst*
dtype0	*
_output_shapes
: *
valueB	 R����
�
dnn/zero_fraction_1/LessEqual	LessEqualdnn/zero_fraction_1/Sizednn/zero_fraction_1/LessEqual/y*
T0	*
_output_shapes
: 
�
dnn/zero_fraction_1/cond/SwitchSwitchdnn/zero_fraction_1/LessEqualdnn/zero_fraction_1/LessEqual*
_output_shapes
: : *
T0

q
!dnn/zero_fraction_1/cond/switch_tIdentity!dnn/zero_fraction_1/cond/Switch:1*
T0
*
_output_shapes
: 
o
!dnn/zero_fraction_1/cond/switch_fIdentitydnn/zero_fraction_1/cond/Switch*
T0
*
_output_shapes
: 
l
 dnn/zero_fraction_1/cond/pred_idIdentitydnn/zero_fraction_1/LessEqual*
T0
*
_output_shapes
: 
�
,dnn/zero_fraction_1/cond/count_nonzero/zerosConst"^dnn/zero_fraction_1/cond/switch_t*
_output_shapes
: *
valueB
 *    *
dtype0
�
/dnn/zero_fraction_1/cond/count_nonzero/NotEqualNotEqual8dnn/zero_fraction_1/cond/count_nonzero/NotEqual/Switch:1,dnn/zero_fraction_1/cond/count_nonzero/zeros*
T0*(
_output_shapes
:����������
�
6dnn/zero_fraction_1/cond/count_nonzero/NotEqual/SwitchSwitchdnn/hiddenlayer_1/Sigmoid dnn/zero_fraction_1/cond/pred_id*
T0*,
_class"
 loc:@dnn/hiddenlayer_1/Sigmoid*<
_output_shapes*
(:����������:����������
�
+dnn/zero_fraction_1/cond/count_nonzero/CastCast/dnn/zero_fraction_1/cond/count_nonzero/NotEqual*

SrcT0
*(
_output_shapes
:����������*

DstT0
�
,dnn/zero_fraction_1/cond/count_nonzero/ConstConst"^dnn/zero_fraction_1/cond/switch_t*
valueB"       *
dtype0*
_output_shapes
:
�
4dnn/zero_fraction_1/cond/count_nonzero/nonzero_countSum+dnn/zero_fraction_1/cond/count_nonzero/Cast,dnn/zero_fraction_1/cond/count_nonzero/Const*
T0*
_output_shapes
: 
�
dnn/zero_fraction_1/cond/CastCast4dnn/zero_fraction_1/cond/count_nonzero/nonzero_count*

SrcT0*
_output_shapes
: *

DstT0	
�
.dnn/zero_fraction_1/cond/count_nonzero_1/zerosConst"^dnn/zero_fraction_1/cond/switch_f*
valueB
 *    *
dtype0*
_output_shapes
: 
�
1dnn/zero_fraction_1/cond/count_nonzero_1/NotEqualNotEqual8dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual/Switch.dnn/zero_fraction_1/cond/count_nonzero_1/zeros*(
_output_shapes
:����������*
T0
�
8dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual/SwitchSwitchdnn/hiddenlayer_1/Sigmoid dnn/zero_fraction_1/cond/pred_id*<
_output_shapes*
(:����������:����������*
T0*,
_class"
 loc:@dnn/hiddenlayer_1/Sigmoid
�
-dnn/zero_fraction_1/cond/count_nonzero_1/CastCast1dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual*(
_output_shapes
:����������*

DstT0	*

SrcT0

�
.dnn/zero_fraction_1/cond/count_nonzero_1/ConstConst"^dnn/zero_fraction_1/cond/switch_f*
valueB"       *
dtype0*
_output_shapes
:
�
6dnn/zero_fraction_1/cond/count_nonzero_1/nonzero_countSum-dnn/zero_fraction_1/cond/count_nonzero_1/Cast.dnn/zero_fraction_1/cond/count_nonzero_1/Const*
T0	*
_output_shapes
: 
�
dnn/zero_fraction_1/cond/MergeMerge6dnn/zero_fraction_1/cond/count_nonzero_1/nonzero_countdnn/zero_fraction_1/cond/Cast*
T0	*
N*
_output_shapes
: : 
�
*dnn/zero_fraction_1/counts_to_fraction/subSubdnn/zero_fraction_1/Sizednn/zero_fraction_1/cond/Merge*
T0	*
_output_shapes
: 
�
+dnn/zero_fraction_1/counts_to_fraction/CastCast*dnn/zero_fraction_1/counts_to_fraction/sub*
_output_shapes
: *

DstT0*

SrcT0	

-dnn/zero_fraction_1/counts_to_fraction/Cast_1Castdnn/zero_fraction_1/Size*
_output_shapes
: *

DstT0*

SrcT0	
�
.dnn/zero_fraction_1/counts_to_fraction/truedivRealDiv+dnn/zero_fraction_1/counts_to_fraction/Cast-dnn/zero_fraction_1/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
y
dnn/zero_fraction_1/fractionIdentity.dnn/zero_fraction_1/counts_to_fraction/truediv*
_output_shapes
: *
T0
�
2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_1/fraction_of_zero_values*
dtype0*
_output_shapes
: 
�
-dnn/dnn/hiddenlayer_1/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsdnn/zero_fraction_1/fraction*
T0*
_output_shapes
: 
�
$dnn/dnn/hiddenlayer_1/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_1/activation*
dtype0*
_output_shapes
: 
�
 dnn/dnn/hiddenlayer_1/activationHistogramSummary$dnn/dnn/hiddenlayer_1/activation/tagdnn/hiddenlayer_1/Sigmoid*
_output_shapes
: 
�
@dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/shapeConst*
valueB"      *2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes
:
�
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/minConst*
valueB
 *׳ݽ*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes
: 
�
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *׳�=*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes
: 
�
Hdnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/shape* 
_output_shapes
:
��*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0
�
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
�
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0* 
_output_shapes
:
��
�
:dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/min* 
_output_shapes
:
��*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0
�
dnn/hiddenlayer_2/kernel/part_0VarHandleOp*
shape:
��*0
shared_name!dnn/hiddenlayer_2/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes
: 
�
@dnn/hiddenlayer_2/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
�
&dnn/hiddenlayer_2/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_2/kernel/part_0:dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0
�
3dnn/hiddenlayer_2/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0* 
_output_shapes
:
��
�
/dnn/hiddenlayer_2/bias/part_0/Initializer/zerosConst*
valueB�*    *0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes	
:�
�
dnn/hiddenlayer_2/bias/part_0VarHandleOp*
_output_shapes
: *
shape:�*.
shared_namednn/hiddenlayer_2/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
dtype0
�
>dnn/hiddenlayer_2/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_2/bias/part_0*
_output_shapes
: 
�
$dnn/hiddenlayer_2/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_2/bias/part_0/dnn/hiddenlayer_2/bias/part_0/Initializer/zeros*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
dtype0
�
1dnn/hiddenlayer_2/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*
_output_shapes	
:�*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
dtype0
�
'dnn/hiddenlayer_2/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*
dtype0* 
_output_shapes
:
��
x
dnn/hiddenlayer_2/kernelIdentity'dnn/hiddenlayer_2/kernel/ReadVariableOp*
T0* 
_output_shapes
:
��
�
dnn/hiddenlayer_2/MatMulMatMuldnn/hiddenlayer_1/Sigmoiddnn/hiddenlayer_2/kernel*(
_output_shapes
:����������*
T0
�
%dnn/hiddenlayer_2/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes	
:�
o
dnn/hiddenlayer_2/biasIdentity%dnn/hiddenlayer_2/bias/ReadVariableOp*
T0*
_output_shapes	
:�
�
dnn/hiddenlayer_2/BiasAddBiasAdddnn/hiddenlayer_2/MatMuldnn/hiddenlayer_2/bias*
T0*(
_output_shapes
:����������
r
dnn/hiddenlayer_2/SigmoidSigmoiddnn/hiddenlayer_2/BiasAdd*
T0*(
_output_shapes
:����������
l
dnn/zero_fraction_2/SizeSizednn/hiddenlayer_2/Sigmoid*
T0*
out_type0	*
_output_shapes
: 
e
dnn/zero_fraction_2/LessEqual/yConst*
valueB	 R����*
dtype0	*
_output_shapes
: 
�
dnn/zero_fraction_2/LessEqual	LessEqualdnn/zero_fraction_2/Sizednn/zero_fraction_2/LessEqual/y*
T0	*
_output_shapes
: 
�
dnn/zero_fraction_2/cond/SwitchSwitchdnn/zero_fraction_2/LessEqualdnn/zero_fraction_2/LessEqual*
T0
*
_output_shapes
: : 
q
!dnn/zero_fraction_2/cond/switch_tIdentity!dnn/zero_fraction_2/cond/Switch:1*
T0
*
_output_shapes
: 
o
!dnn/zero_fraction_2/cond/switch_fIdentitydnn/zero_fraction_2/cond/Switch*
T0
*
_output_shapes
: 
l
 dnn/zero_fraction_2/cond/pred_idIdentitydnn/zero_fraction_2/LessEqual*
_output_shapes
: *
T0

�
,dnn/zero_fraction_2/cond/count_nonzero/zerosConst"^dnn/zero_fraction_2/cond/switch_t*
valueB
 *    *
dtype0*
_output_shapes
: 
�
/dnn/zero_fraction_2/cond/count_nonzero/NotEqualNotEqual8dnn/zero_fraction_2/cond/count_nonzero/NotEqual/Switch:1,dnn/zero_fraction_2/cond/count_nonzero/zeros*
T0*(
_output_shapes
:����������
�
6dnn/zero_fraction_2/cond/count_nonzero/NotEqual/SwitchSwitchdnn/hiddenlayer_2/Sigmoid dnn/zero_fraction_2/cond/pred_id*,
_class"
 loc:@dnn/hiddenlayer_2/Sigmoid*<
_output_shapes*
(:����������:����������*
T0
�
+dnn/zero_fraction_2/cond/count_nonzero/CastCast/dnn/zero_fraction_2/cond/count_nonzero/NotEqual*

SrcT0
*(
_output_shapes
:����������*

DstT0
�
,dnn/zero_fraction_2/cond/count_nonzero/ConstConst"^dnn/zero_fraction_2/cond/switch_t*
valueB"       *
dtype0*
_output_shapes
:
�
4dnn/zero_fraction_2/cond/count_nonzero/nonzero_countSum+dnn/zero_fraction_2/cond/count_nonzero/Cast,dnn/zero_fraction_2/cond/count_nonzero/Const*
_output_shapes
: *
T0
�
dnn/zero_fraction_2/cond/CastCast4dnn/zero_fraction_2/cond/count_nonzero/nonzero_count*
_output_shapes
: *

DstT0	*

SrcT0
�
.dnn/zero_fraction_2/cond/count_nonzero_1/zerosConst"^dnn/zero_fraction_2/cond/switch_f*
valueB
 *    *
dtype0*
_output_shapes
: 
�
1dnn/zero_fraction_2/cond/count_nonzero_1/NotEqualNotEqual8dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual/Switch.dnn/zero_fraction_2/cond/count_nonzero_1/zeros*
T0*(
_output_shapes
:����������
�
8dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual/SwitchSwitchdnn/hiddenlayer_2/Sigmoid dnn/zero_fraction_2/cond/pred_id*
T0*,
_class"
 loc:@dnn/hiddenlayer_2/Sigmoid*<
_output_shapes*
(:����������:����������
�
-dnn/zero_fraction_2/cond/count_nonzero_1/CastCast1dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual*(
_output_shapes
:����������*

DstT0	*

SrcT0

�
.dnn/zero_fraction_2/cond/count_nonzero_1/ConstConst"^dnn/zero_fraction_2/cond/switch_f*
valueB"       *
dtype0*
_output_shapes
:
�
6dnn/zero_fraction_2/cond/count_nonzero_1/nonzero_countSum-dnn/zero_fraction_2/cond/count_nonzero_1/Cast.dnn/zero_fraction_2/cond/count_nonzero_1/Const*
_output_shapes
: *
T0	
�
dnn/zero_fraction_2/cond/MergeMerge6dnn/zero_fraction_2/cond/count_nonzero_1/nonzero_countdnn/zero_fraction_2/cond/Cast*
T0	*
N*
_output_shapes
: : 
�
*dnn/zero_fraction_2/counts_to_fraction/subSubdnn/zero_fraction_2/Sizednn/zero_fraction_2/cond/Merge*
_output_shapes
: *
T0	
�
+dnn/zero_fraction_2/counts_to_fraction/CastCast*dnn/zero_fraction_2/counts_to_fraction/sub*

SrcT0	*
_output_shapes
: *

DstT0

-dnn/zero_fraction_2/counts_to_fraction/Cast_1Castdnn/zero_fraction_2/Size*
_output_shapes
: *

DstT0*

SrcT0	
�
.dnn/zero_fraction_2/counts_to_fraction/truedivRealDiv+dnn/zero_fraction_2/counts_to_fraction/Cast-dnn/zero_fraction_2/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
y
dnn/zero_fraction_2/fractionIdentity.dnn/zero_fraction_2/counts_to_fraction/truediv*
T0*
_output_shapes
: 
�
2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_2/fraction_of_zero_values*
dtype0*
_output_shapes
: 
�
-dnn/dnn/hiddenlayer_2/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsdnn/zero_fraction_2/fraction*
T0*
_output_shapes
: 
�
$dnn/dnn/hiddenlayer_2/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_2/activation*
dtype0*
_output_shapes
: 
�
 dnn/dnn/hiddenlayer_2/activationHistogramSummary$dnn/dnn/hiddenlayer_2/activation/tagdnn/hiddenlayer_2/Sigmoid*
_output_shapes
: 
�
@dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/shapeConst*
valueB"   �   *2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
dtype0*
_output_shapes
:
�
>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/minConst*
_output_shapes
: *
valueB
 *   �*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
dtype0
�
>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *   >*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
dtype0*
_output_shapes
: 
�
Hdnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/shape* 
_output_shapes
:
��*
T0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
dtype0
�
>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/min*
_output_shapes
: *
T0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0
�
>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0* 
_output_shapes
:
��
�
:dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0* 
_output_shapes
:
��
�
dnn/hiddenlayer_3/kernel/part_0VarHandleOp*
_output_shapes
: *
shape:
��*0
shared_name!dnn/hiddenlayer_3/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
dtype0
�
@dnn/hiddenlayer_3/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_3/kernel/part_0*
_output_shapes
: 
�
&dnn/hiddenlayer_3/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_3/kernel/part_0:dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
dtype0
�
3dnn/hiddenlayer_3/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/kernel/part_0* 
_output_shapes
:
��*2
_class(
&$loc:@dnn/hiddenlayer_3/kernel/part_0*
dtype0
�
/dnn/hiddenlayer_3/bias/part_0/Initializer/zerosConst*
dtype0*
_output_shapes	
:�*
valueB�*    *0
_class&
$"loc:@dnn/hiddenlayer_3/bias/part_0
�
dnn/hiddenlayer_3/bias/part_0VarHandleOp*
dtype0*
_output_shapes
: *
shape:�*.
shared_namednn/hiddenlayer_3/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_3/bias/part_0
�
>dnn/hiddenlayer_3/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_3/bias/part_0*
_output_shapes
: 
�
$dnn/hiddenlayer_3/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_3/bias/part_0/dnn/hiddenlayer_3/bias/part_0/Initializer/zeros*0
_class&
$"loc:@dnn/hiddenlayer_3/bias/part_0*
dtype0
�
1dnn/hiddenlayer_3/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_3/bias/part_0*
dtype0*
_output_shapes	
:�
�
'dnn/hiddenlayer_3/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/kernel/part_0* 
_output_shapes
:
��*
dtype0
x
dnn/hiddenlayer_3/kernelIdentity'dnn/hiddenlayer_3/kernel/ReadVariableOp* 
_output_shapes
:
��*
T0
�
dnn/hiddenlayer_3/MatMulMatMuldnn/hiddenlayer_2/Sigmoiddnn/hiddenlayer_3/kernel*
T0*(
_output_shapes
:����������
�
%dnn/hiddenlayer_3/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/bias/part_0*
dtype0*
_output_shapes	
:�
o
dnn/hiddenlayer_3/biasIdentity%dnn/hiddenlayer_3/bias/ReadVariableOp*
_output_shapes	
:�*
T0
�
dnn/hiddenlayer_3/BiasAddBiasAdddnn/hiddenlayer_3/MatMuldnn/hiddenlayer_3/bias*
T0*(
_output_shapes
:����������
r
dnn/hiddenlayer_3/SigmoidSigmoiddnn/hiddenlayer_3/BiasAdd*(
_output_shapes
:����������*
T0
l
dnn/zero_fraction_3/SizeSizednn/hiddenlayer_3/Sigmoid*
T0*
out_type0	*
_output_shapes
: 
e
dnn/zero_fraction_3/LessEqual/yConst*
valueB	 R����*
dtype0	*
_output_shapes
: 
�
dnn/zero_fraction_3/LessEqual	LessEqualdnn/zero_fraction_3/Sizednn/zero_fraction_3/LessEqual/y*
T0	*
_output_shapes
: 
�
dnn/zero_fraction_3/cond/SwitchSwitchdnn/zero_fraction_3/LessEqualdnn/zero_fraction_3/LessEqual*
T0
*
_output_shapes
: : 
q
!dnn/zero_fraction_3/cond/switch_tIdentity!dnn/zero_fraction_3/cond/Switch:1*
T0
*
_output_shapes
: 
o
!dnn/zero_fraction_3/cond/switch_fIdentitydnn/zero_fraction_3/cond/Switch*
_output_shapes
: *
T0

l
 dnn/zero_fraction_3/cond/pred_idIdentitydnn/zero_fraction_3/LessEqual*
_output_shapes
: *
T0

�
,dnn/zero_fraction_3/cond/count_nonzero/zerosConst"^dnn/zero_fraction_3/cond/switch_t*
valueB
 *    *
dtype0*
_output_shapes
: 
�
/dnn/zero_fraction_3/cond/count_nonzero/NotEqualNotEqual8dnn/zero_fraction_3/cond/count_nonzero/NotEqual/Switch:1,dnn/zero_fraction_3/cond/count_nonzero/zeros*(
_output_shapes
:����������*
T0
�
6dnn/zero_fraction_3/cond/count_nonzero/NotEqual/SwitchSwitchdnn/hiddenlayer_3/Sigmoid dnn/zero_fraction_3/cond/pred_id*
T0*,
_class"
 loc:@dnn/hiddenlayer_3/Sigmoid*<
_output_shapes*
(:����������:����������
�
+dnn/zero_fraction_3/cond/count_nonzero/CastCast/dnn/zero_fraction_3/cond/count_nonzero/NotEqual*

SrcT0
*(
_output_shapes
:����������*

DstT0
�
,dnn/zero_fraction_3/cond/count_nonzero/ConstConst"^dnn/zero_fraction_3/cond/switch_t*
valueB"       *
dtype0*
_output_shapes
:
�
4dnn/zero_fraction_3/cond/count_nonzero/nonzero_countSum+dnn/zero_fraction_3/cond/count_nonzero/Cast,dnn/zero_fraction_3/cond/count_nonzero/Const*
_output_shapes
: *
T0
�
dnn/zero_fraction_3/cond/CastCast4dnn/zero_fraction_3/cond/count_nonzero/nonzero_count*
_output_shapes
: *

DstT0	*

SrcT0
�
.dnn/zero_fraction_3/cond/count_nonzero_1/zerosConst"^dnn/zero_fraction_3/cond/switch_f*
valueB
 *    *
dtype0*
_output_shapes
: 
�
1dnn/zero_fraction_3/cond/count_nonzero_1/NotEqualNotEqual8dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual/Switch.dnn/zero_fraction_3/cond/count_nonzero_1/zeros*
T0*(
_output_shapes
:����������
�
8dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual/SwitchSwitchdnn/hiddenlayer_3/Sigmoid dnn/zero_fraction_3/cond/pred_id*,
_class"
 loc:@dnn/hiddenlayer_3/Sigmoid*<
_output_shapes*
(:����������:����������*
T0
�
-dnn/zero_fraction_3/cond/count_nonzero_1/CastCast1dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual*

SrcT0
*(
_output_shapes
:����������*

DstT0	
�
.dnn/zero_fraction_3/cond/count_nonzero_1/ConstConst"^dnn/zero_fraction_3/cond/switch_f*
valueB"       *
dtype0*
_output_shapes
:
�
6dnn/zero_fraction_3/cond/count_nonzero_1/nonzero_countSum-dnn/zero_fraction_3/cond/count_nonzero_1/Cast.dnn/zero_fraction_3/cond/count_nonzero_1/Const*
T0	*
_output_shapes
: 
�
dnn/zero_fraction_3/cond/MergeMerge6dnn/zero_fraction_3/cond/count_nonzero_1/nonzero_countdnn/zero_fraction_3/cond/Cast*
N*
_output_shapes
: : *
T0	
�
*dnn/zero_fraction_3/counts_to_fraction/subSubdnn/zero_fraction_3/Sizednn/zero_fraction_3/cond/Merge*
_output_shapes
: *
T0	
�
+dnn/zero_fraction_3/counts_to_fraction/CastCast*dnn/zero_fraction_3/counts_to_fraction/sub*

SrcT0	*
_output_shapes
: *

DstT0

-dnn/zero_fraction_3/counts_to_fraction/Cast_1Castdnn/zero_fraction_3/Size*

SrcT0	*
_output_shapes
: *

DstT0
�
.dnn/zero_fraction_3/counts_to_fraction/truedivRealDiv+dnn/zero_fraction_3/counts_to_fraction/Cast-dnn/zero_fraction_3/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
y
dnn/zero_fraction_3/fractionIdentity.dnn/zero_fraction_3/counts_to_fraction/truediv*
_output_shapes
: *
T0
�
2dnn/dnn/hiddenlayer_3/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_3/fraction_of_zero_values*
dtype0*
_output_shapes
: 
�
-dnn/dnn/hiddenlayer_3/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_3/fraction_of_zero_values/tagsdnn/zero_fraction_3/fraction*
T0*
_output_shapes
: 
�
$dnn/dnn/hiddenlayer_3/activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_3/activation
�
 dnn/dnn/hiddenlayer_3/activationHistogramSummary$dnn/dnn/hiddenlayer_3/activation/tagdnn/hiddenlayer_3/Sigmoid*
_output_shapes
: 
�
9dnn/logits/kernel/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"�      *+
_class!
loc:@dnn/logits/kernel/part_0
�
7dnn/logits/kernel/part_0/Initializer/random_uniform/minConst*
valueB
 *n�\�*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes
: 
�
7dnn/logits/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *n�\>*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes
: 
�
Adnn/logits/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform9dnn/logits/kernel/part_0/Initializer/random_uniform/shape*
_output_shapes
:	�*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0
�
7dnn/logits/kernel/part_0/Initializer/random_uniform/subSub7dnn/logits/kernel/part_0/Initializer/random_uniform/max7dnn/logits/kernel/part_0/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes
: 
�
7dnn/logits/kernel/part_0/Initializer/random_uniform/mulMulAdnn/logits/kernel/part_0/Initializer/random_uniform/RandomUniform7dnn/logits/kernel/part_0/Initializer/random_uniform/sub*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes
:	�
�
3dnn/logits/kernel/part_0/Initializer/random_uniformAdd7dnn/logits/kernel/part_0/Initializer/random_uniform/mul7dnn/logits/kernel/part_0/Initializer/random_uniform/min*
_output_shapes
:	�*
T0*+
_class!
loc:@dnn/logits/kernel/part_0
�
dnn/logits/kernel/part_0VarHandleOp*
dtype0*
_output_shapes
: *
shape:	�*)
shared_namednn/logits/kernel/part_0*+
_class!
loc:@dnn/logits/kernel/part_0
�
9dnn/logits/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/logits/kernel/part_0*
_output_shapes
: 
�
dnn/logits/kernel/part_0/AssignAssignVariableOpdnn/logits/kernel/part_03dnn/logits/kernel/part_0/Initializer/random_uniform*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0
�
,dnn/logits/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes
:	�
�
(dnn/logits/bias/part_0/Initializer/zerosConst*
valueB*    *)
_class
loc:@dnn/logits/bias/part_0*
dtype0*
_output_shapes
:
�
dnn/logits/bias/part_0VarHandleOp*
shape:*'
shared_namednn/logits/bias/part_0*)
_class
loc:@dnn/logits/bias/part_0*
dtype0*
_output_shapes
: 
}
7dnn/logits/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/logits/bias/part_0*
_output_shapes
: 
�
dnn/logits/bias/part_0/AssignAssignVariableOpdnn/logits/bias/part_0(dnn/logits/bias/part_0/Initializer/zeros*)
_class
loc:@dnn/logits/bias/part_0*
dtype0
�
*dnn/logits/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*)
_class
loc:@dnn/logits/bias/part_0*
dtype0*
_output_shapes
:
z
 dnn/logits/kernel/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*
dtype0*
_output_shapes
:	�
i
dnn/logits/kernelIdentity dnn/logits/kernel/ReadVariableOp*
T0*
_output_shapes
:	�
{
dnn/logits/MatMulMatMuldnn/hiddenlayer_3/Sigmoiddnn/logits/kernel*
T0*'
_output_shapes
:���������
q
dnn/logits/bias/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*
dtype0*
_output_shapes
:
`
dnn/logits/biasIdentitydnn/logits/bias/ReadVariableOp*
_output_shapes
:*
T0
s
dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/bias*'
_output_shapes
:���������*
T0
e
dnn/zero_fraction_4/SizeSizednn/logits/BiasAdd*
T0*
out_type0	*
_output_shapes
: 
e
dnn/zero_fraction_4/LessEqual/yConst*
_output_shapes
: *
valueB	 R����*
dtype0	
�
dnn/zero_fraction_4/LessEqual	LessEqualdnn/zero_fraction_4/Sizednn/zero_fraction_4/LessEqual/y*
T0	*
_output_shapes
: 
�
dnn/zero_fraction_4/cond/SwitchSwitchdnn/zero_fraction_4/LessEqualdnn/zero_fraction_4/LessEqual*
T0
*
_output_shapes
: : 
q
!dnn/zero_fraction_4/cond/switch_tIdentity!dnn/zero_fraction_4/cond/Switch:1*
T0
*
_output_shapes
: 
o
!dnn/zero_fraction_4/cond/switch_fIdentitydnn/zero_fraction_4/cond/Switch*
T0
*
_output_shapes
: 
l
 dnn/zero_fraction_4/cond/pred_idIdentitydnn/zero_fraction_4/LessEqual*
_output_shapes
: *
T0

�
,dnn/zero_fraction_4/cond/count_nonzero/zerosConst"^dnn/zero_fraction_4/cond/switch_t*
valueB
 *    *
dtype0*
_output_shapes
: 
�
/dnn/zero_fraction_4/cond/count_nonzero/NotEqualNotEqual8dnn/zero_fraction_4/cond/count_nonzero/NotEqual/Switch:1,dnn/zero_fraction_4/cond/count_nonzero/zeros*'
_output_shapes
:���������*
T0
�
6dnn/zero_fraction_4/cond/count_nonzero/NotEqual/SwitchSwitchdnn/logits/BiasAdd dnn/zero_fraction_4/cond/pred_id*
T0*%
_class
loc:@dnn/logits/BiasAdd*:
_output_shapes(
&:���������:���������
�
+dnn/zero_fraction_4/cond/count_nonzero/CastCast/dnn/zero_fraction_4/cond/count_nonzero/NotEqual*'
_output_shapes
:���������*

DstT0*

SrcT0

�
,dnn/zero_fraction_4/cond/count_nonzero/ConstConst"^dnn/zero_fraction_4/cond/switch_t*
valueB"       *
dtype0*
_output_shapes
:
�
4dnn/zero_fraction_4/cond/count_nonzero/nonzero_countSum+dnn/zero_fraction_4/cond/count_nonzero/Cast,dnn/zero_fraction_4/cond/count_nonzero/Const*
_output_shapes
: *
T0
�
dnn/zero_fraction_4/cond/CastCast4dnn/zero_fraction_4/cond/count_nonzero/nonzero_count*

SrcT0*
_output_shapes
: *

DstT0	
�
.dnn/zero_fraction_4/cond/count_nonzero_1/zerosConst"^dnn/zero_fraction_4/cond/switch_f*
valueB
 *    *
dtype0*
_output_shapes
: 
�
1dnn/zero_fraction_4/cond/count_nonzero_1/NotEqualNotEqual8dnn/zero_fraction_4/cond/count_nonzero_1/NotEqual/Switch.dnn/zero_fraction_4/cond/count_nonzero_1/zeros*'
_output_shapes
:���������*
T0
�
8dnn/zero_fraction_4/cond/count_nonzero_1/NotEqual/SwitchSwitchdnn/logits/BiasAdd dnn/zero_fraction_4/cond/pred_id*
T0*%
_class
loc:@dnn/logits/BiasAdd*:
_output_shapes(
&:���������:���������
�
-dnn/zero_fraction_4/cond/count_nonzero_1/CastCast1dnn/zero_fraction_4/cond/count_nonzero_1/NotEqual*

SrcT0
*'
_output_shapes
:���������*

DstT0	
�
.dnn/zero_fraction_4/cond/count_nonzero_1/ConstConst"^dnn/zero_fraction_4/cond/switch_f*
_output_shapes
:*
valueB"       *
dtype0
�
6dnn/zero_fraction_4/cond/count_nonzero_1/nonzero_countSum-dnn/zero_fraction_4/cond/count_nonzero_1/Cast.dnn/zero_fraction_4/cond/count_nonzero_1/Const*
_output_shapes
: *
T0	
�
dnn/zero_fraction_4/cond/MergeMerge6dnn/zero_fraction_4/cond/count_nonzero_1/nonzero_countdnn/zero_fraction_4/cond/Cast*
T0	*
N*
_output_shapes
: : 
�
*dnn/zero_fraction_4/counts_to_fraction/subSubdnn/zero_fraction_4/Sizednn/zero_fraction_4/cond/Merge*
_output_shapes
: *
T0	
�
+dnn/zero_fraction_4/counts_to_fraction/CastCast*dnn/zero_fraction_4/counts_to_fraction/sub*
_output_shapes
: *

DstT0*

SrcT0	

-dnn/zero_fraction_4/counts_to_fraction/Cast_1Castdnn/zero_fraction_4/Size*
_output_shapes
: *

DstT0*

SrcT0	
�
.dnn/zero_fraction_4/counts_to_fraction/truedivRealDiv+dnn/zero_fraction_4/counts_to_fraction/Cast-dnn/zero_fraction_4/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
y
dnn/zero_fraction_4/fractionIdentity.dnn/zero_fraction_4/counts_to_fraction/truediv*
T0*
_output_shapes
: 
�
+dnn/dnn/logits/fraction_of_zero_values/tagsConst*7
value.B, B&dnn/dnn/logits/fraction_of_zero_values*
dtype0*
_output_shapes
: 
�
&dnn/dnn/logits/fraction_of_zero_valuesScalarSummary+dnn/dnn/logits/fraction_of_zero_values/tagsdnn/zero_fraction_4/fraction*
_output_shapes
: *
T0
w
dnn/dnn/logits/activation/tagConst*
_output_shapes
: **
value!B Bdnn/dnn/logits/activation*
dtype0
x
dnn/dnn/logits/activationHistogramSummarydnn/dnn/logits/activation/tagdnn/logits/BiasAdd*
_output_shapes
: 
W
dnn/head/logits/ShapeShapednn/logits/BiasAdd*
_output_shapes
:*
T0
k
)dnn/head/logits/assert_rank_at_least/rankConst*
dtype0*
_output_shapes
: *
value	B :
[
Sdnn/head/logits/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
L
Ddnn/head/logits/assert_rank_at_least/static_checks_determined_all_okNoOp

initNoOp
�
init_all_tablesNoOpr^dnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/hash_table/table_init/LookupTableImportV2z^dnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/hash_table/table_init/LookupTableImportV2v^dnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/hash_table/table_init/LookupTableImportV2

init_1NoOp
4

group_depsNoOp^init^init_1^init_all_tables
Y
save/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
n
save/filenamePlaceholderWithDefaultsave/filename/input*
dtype0*
_output_shapes
: *
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
dtype0*
_output_shapes
: *
shape: 
s
save/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes	
:�
Y
save/IdentityIdentitysave/Read/ReadVariableOp*
T0*
_output_shapes	
:�
_
save/Identity_1Identitysave/Identity"/device:CPU:0*
T0*
_output_shapes	
:�
{
save/Read_1/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
:	z�
a
save/Identity_2Identitysave/Read_1/ReadVariableOp*
T0*
_output_shapes
:	z�
e
save/Identity_3Identitysave/Identity_2"/device:CPU:0*
_output_shapes
:	z�*
T0
u
save/Read_2/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes	
:�
]
save/Identity_4Identitysave/Read_2/ReadVariableOp*
_output_shapes	
:�*
T0
a
save/Identity_5Identitysave/Identity_4"/device:CPU:0*
T0*
_output_shapes	
:�
|
save/Read_3/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*
dtype0* 
_output_shapes
:
��
b
save/Identity_6Identitysave/Read_3/ReadVariableOp*
T0* 
_output_shapes
:
��
f
save/Identity_7Identitysave/Identity_6"/device:CPU:0*
T0* 
_output_shapes
:
��
u
save/Read_4/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes	
:�
]
save/Identity_8Identitysave/Read_4/ReadVariableOp*
T0*
_output_shapes	
:�
a
save/Identity_9Identitysave/Identity_8"/device:CPU:0*
_output_shapes	
:�*
T0
|
save/Read_5/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*
dtype0* 
_output_shapes
:
��
c
save/Identity_10Identitysave/Read_5/ReadVariableOp*
T0* 
_output_shapes
:
��
h
save/Identity_11Identitysave/Identity_10"/device:CPU:0* 
_output_shapes
:
��*
T0
u
save/Read_6/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/bias/part_0*
dtype0*
_output_shapes	
:�
^
save/Identity_12Identitysave/Read_6/ReadVariableOp*
T0*
_output_shapes	
:�
c
save/Identity_13Identitysave/Identity_12"/device:CPU:0*
_output_shapes	
:�*
T0
|
save/Read_7/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/kernel/part_0*
dtype0* 
_output_shapes
:
��
c
save/Identity_14Identitysave/Read_7/ReadVariableOp*
T0* 
_output_shapes
:
��
h
save/Identity_15Identitysave/Identity_14"/device:CPU:0*
T0* 
_output_shapes
:
��
�
save/Read_8/ReadVariableOpReadVariableOpSdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
:	�
b
save/Identity_16Identitysave/Read_8/ReadVariableOp*
_output_shapes
:	�*
T0
g
save/Identity_17Identitysave/Identity_16"/device:CPU:0*
_output_shapes
:	�*
T0
�
save/Read_9/ReadVariableOpReadVariableOpWdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
:	�@
b
save/Identity_18Identitysave/Read_9/ReadVariableOp*
_output_shapes
:	�@*
T0
g
save/Identity_19Identitysave/Identity_18"/device:CPU:0*
T0*
_output_shapes
:	�@
�
save/Read_10/ReadVariableOpReadVariableOpUdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0*
_output_shapes
:	�*
dtype0
c
save/Identity_20Identitysave/Read_10/ReadVariableOp*
_output_shapes
:	�*
T0
g
save/Identity_21Identitysave/Identity_20"/device:CPU:0*
T0*
_output_shapes
:	�
n
save/Read_11/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*
dtype0*
_output_shapes
:
^
save/Identity_22Identitysave/Read_11/ReadVariableOp*
T0*
_output_shapes
:
b
save/Identity_23Identitysave/Identity_22"/device:CPU:0*
T0*
_output_shapes
:
u
save/Read_12/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*
_output_shapes
:	�*
dtype0
c
save/Identity_24Identitysave/Read_12/ReadVariableOp*
_output_shapes
:	�*
T0
g
save/Identity_25Identitysave/Identity_24"/device:CPU:0*
_output_shapes
:	�*
T0
�
save/StringJoin/inputs_1Const*<
value3B1 B+_temp_cf1b609952bf48099c6d78f365d14a05/part*
dtype0*
_output_shapes
: 
d
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
dtype0*
_output_shapes
: *
value	B : 
�
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
{
save/SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:* 
valueBBglobal_step*
dtype0
t
save/SaveV2/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
�
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesglobal_step"/device:CPU:0*
dtypes
2	
�
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
m
save/ShardedFilename_1/shardConst"/device:CPU:0*
value	B :*
dtype0*
_output_shapes
: 
�
save/ShardedFilename_1ShardedFilenamesave/StringJoinsave/ShardedFilename_1/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
�
save/Read_13/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes	
:�
n
save/Identity_26Identitysave/Read_13/ReadVariableOp"/device:CPU:0*
_output_shapes	
:�*
T0
c
save/Identity_27Identitysave/Identity_26"/device:CPU:0*
_output_shapes	
:�*
T0
�
save/Read_14/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes
:	z�
r
save/Identity_28Identitysave/Read_14/ReadVariableOp"/device:CPU:0*
_output_shapes
:	z�*
T0
g
save/Identity_29Identitysave/Identity_28"/device:CPU:0*
T0*
_output_shapes
:	z�
�
save/Read_15/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes	
:�
n
save/Identity_30Identitysave/Read_15/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes	
:�
c
save/Identity_31Identitysave/Identity_30"/device:CPU:0*
_output_shapes	
:�*
T0
�
save/Read_16/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0"/device:CPU:0*
dtype0* 
_output_shapes
:
��
s
save/Identity_32Identitysave/Read_16/ReadVariableOp"/device:CPU:0* 
_output_shapes
:
��*
T0
h
save/Identity_33Identitysave/Identity_32"/device:CPU:0*
T0* 
_output_shapes
:
��
�
save/Read_17/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes	
:�
n
save/Identity_34Identitysave/Read_17/ReadVariableOp"/device:CPU:0*
_output_shapes	
:�*
T0
c
save/Identity_35Identitysave/Identity_34"/device:CPU:0*
_output_shapes	
:�*
T0
�
save/Read_18/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0"/device:CPU:0*
dtype0* 
_output_shapes
:
��
s
save/Identity_36Identitysave/Read_18/ReadVariableOp"/device:CPU:0* 
_output_shapes
:
��*
T0
h
save/Identity_37Identitysave/Identity_36"/device:CPU:0*
T0* 
_output_shapes
:
��
�
save/Read_19/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/bias/part_0"/device:CPU:0*
_output_shapes	
:�*
dtype0
n
save/Identity_38Identitysave/Read_19/ReadVariableOp"/device:CPU:0*
_output_shapes	
:�*
T0
c
save/Identity_39Identitysave/Identity_38"/device:CPU:0*
_output_shapes	
:�*
T0
�
save/Read_20/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/kernel/part_0"/device:CPU:0*
dtype0* 
_output_shapes
:
��
s
save/Identity_40Identitysave/Read_20/ReadVariableOp"/device:CPU:0*
T0* 
_output_shapes
:
��
h
save/Identity_41Identitysave/Identity_40"/device:CPU:0* 
_output_shapes
:
��*
T0
�
save/Read_21/ReadVariableOpReadVariableOpSdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0"/device:CPU:0*
dtype0*
_output_shapes
:	�
r
save/Identity_42Identitysave/Read_21/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:	�
g
save/Identity_43Identitysave/Identity_42"/device:CPU:0*
T0*
_output_shapes
:	�
�
save/Read_22/ReadVariableOpReadVariableOpWdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0"/device:CPU:0*
dtype0*
_output_shapes
:	�@
r
save/Identity_44Identitysave/Read_22/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:	�@
g
save/Identity_45Identitysave/Identity_44"/device:CPU:0*
T0*
_output_shapes
:	�@
�
save/Read_23/ReadVariableOpReadVariableOpUdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0"/device:CPU:0*
dtype0*
_output_shapes
:	�
r
save/Identity_46Identitysave/Read_23/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:	�
g
save/Identity_47Identitysave/Identity_46"/device:CPU:0*
_output_shapes
:	�*
T0
}
save/Read_24/ReadVariableOpReadVariableOpdnn/logits/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_48Identitysave/Read_24/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
b
save/Identity_49Identitysave/Identity_48"/device:CPU:0*
T0*
_output_shapes
:
�
save/Read_25/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0"/device:CPU:0*
_output_shapes
:	�*
dtype0
r
save/Identity_50Identitysave/Read_25/ReadVariableOp"/device:CPU:0*
_output_shapes
:	�*
T0
g
save/Identity_51Identitysave/Identity_50"/device:CPU:0*
_output_shapes
:	�*
T0
�
save/SaveV2_1/tensor_namesConst"/device:CPU:0*�
value�B�Bdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/hiddenlayer_3/biasBdnn/hiddenlayer_3/kernelBLdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weightsBPdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weightsBNdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weightsBdnn/logits/biasBdnn/logits/kernel*
dtype0*
_output_shapes
:
�
save/SaveV2_1/shape_and_slicesConst"/device:CPU:0*�
value�B�B	256 0,256B122 256 0,122:0,256B	256 0,256B256 256 0,256:0,256B	256 0,256B256 256 0,256:0,256B	128 0,128B256 128 0,256:0,128B988 16 0,988:0,16B3354 64 0,3354:0,64B1000 16 0,1000:0,16B1 0,1B128 1 0,128:0,1*
dtype0*
_output_shapes
:
�
save/SaveV2_1SaveV2save/ShardedFilename_1save/SaveV2_1/tensor_namessave/SaveV2_1/shape_and_slicessave/Identity_27save/Identity_29save/Identity_31save/Identity_33save/Identity_35save/Identity_37save/Identity_39save/Identity_41save/Identity_43save/Identity_45save/Identity_47save/Identity_49save/Identity_51"/device:CPU:0*
dtypes
2
�
save/control_dependency_1Identitysave/ShardedFilename_1^save/SaveV2_1"/device:CPU:0*
T0*)
_class
loc:@save/ShardedFilename_1*
_output_shapes
: 
�
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilenamesave/ShardedFilename_1^save/control_dependency^save/control_dependency_1"/device:CPU:0*
_output_shapes
:*
T0*
N
u
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0
�
save/Identity_52Identity
save/Const^save/MergeV2Checkpoints^save/control_dependency^save/control_dependency_1"/device:CPU:0*
T0*
_output_shapes
: 
~
save/RestoreV2/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:* 
valueBBglobal_step
w
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*
dtypes
2	*
_output_shapes
:
s
save/AssignAssignglobal_stepsave/RestoreV2*
_output_shapes
: *
T0	*
_class
loc:@global_step
(
save/restore_shardNoOp^save/Assign
�
save/RestoreV2_1/tensor_namesConst"/device:CPU:0*�
value�B�Bdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/hiddenlayer_3/biasBdnn/hiddenlayer_3/kernelBLdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weightsBPdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weightsBNdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weightsBdnn/logits/biasBdnn/logits/kernel*
dtype0*
_output_shapes
:
�
!save/RestoreV2_1/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*�
value�B�B	256 0,256B122 256 0,122:0,256B	256 0,256B256 256 0,256:0,256B	256 0,256B256 256 0,256:0,256B	128 0,128B256 128 0,256:0,128B988 16 0,988:0,16B3354 64 0,3354:0,64B1000 16 0,1000:0,16B1 0,1B128 1 0,128:0,1
�
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices"/device:CPU:0*�
_output_shapes
}:�:	z�:�:
��:�:
��:�:
��:	�:	�@:	�::	�*
dtypes
2
c
save/Identity_53Identitysave/RestoreV2_1"/device:CPU:0*
T0*
_output_shapes	
:�
v
save/AssignVariableOpAssignVariableOpdnn/hiddenlayer_0/bias/part_0save/Identity_53"/device:CPU:0*
dtype0
i
save/Identity_54Identitysave/RestoreV2_1:1"/device:CPU:0*
T0*
_output_shapes
:	z�
z
save/AssignVariableOp_1AssignVariableOpdnn/hiddenlayer_0/kernel/part_0save/Identity_54"/device:CPU:0*
dtype0
e
save/Identity_55Identitysave/RestoreV2_1:2"/device:CPU:0*
T0*
_output_shapes	
:�
x
save/AssignVariableOp_2AssignVariableOpdnn/hiddenlayer_1/bias/part_0save/Identity_55"/device:CPU:0*
dtype0
j
save/Identity_56Identitysave/RestoreV2_1:3"/device:CPU:0* 
_output_shapes
:
��*
T0
z
save/AssignVariableOp_3AssignVariableOpdnn/hiddenlayer_1/kernel/part_0save/Identity_56"/device:CPU:0*
dtype0
e
save/Identity_57Identitysave/RestoreV2_1:4"/device:CPU:0*
_output_shapes	
:�*
T0
x
save/AssignVariableOp_4AssignVariableOpdnn/hiddenlayer_2/bias/part_0save/Identity_57"/device:CPU:0*
dtype0
j
save/Identity_58Identitysave/RestoreV2_1:5"/device:CPU:0*
T0* 
_output_shapes
:
��
z
save/AssignVariableOp_5AssignVariableOpdnn/hiddenlayer_2/kernel/part_0save/Identity_58"/device:CPU:0*
dtype0
e
save/Identity_59Identitysave/RestoreV2_1:6"/device:CPU:0*
_output_shapes	
:�*
T0
x
save/AssignVariableOp_6AssignVariableOpdnn/hiddenlayer_3/bias/part_0save/Identity_59"/device:CPU:0*
dtype0
j
save/Identity_60Identitysave/RestoreV2_1:7"/device:CPU:0* 
_output_shapes
:
��*
T0
z
save/AssignVariableOp_7AssignVariableOpdnn/hiddenlayer_3/kernel/part_0save/Identity_60"/device:CPU:0*
dtype0
i
save/Identity_61Identitysave/RestoreV2_1:8"/device:CPU:0*
T0*
_output_shapes
:	�
�
save/AssignVariableOp_8AssignVariableOpSdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0save/Identity_61"/device:CPU:0*
dtype0
i
save/Identity_62Identitysave/RestoreV2_1:9"/device:CPU:0*
T0*
_output_shapes
:	�@
�
save/AssignVariableOp_9AssignVariableOpWdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0save/Identity_62"/device:CPU:0*
dtype0
j
save/Identity_63Identitysave/RestoreV2_1:10"/device:CPU:0*
T0*
_output_shapes
:	�
�
save/AssignVariableOp_10AssignVariableOpUdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0save/Identity_63"/device:CPU:0*
dtype0
e
save/Identity_64Identitysave/RestoreV2_1:11"/device:CPU:0*
T0*
_output_shapes
:
r
save/AssignVariableOp_11AssignVariableOpdnn/logits/bias/part_0save/Identity_64"/device:CPU:0*
dtype0
j
save/Identity_65Identitysave/RestoreV2_1:12"/device:CPU:0*
_output_shapes
:	�*
T0
t
save/AssignVariableOp_12AssignVariableOpdnn/logits/kernel/part_0save/Identity_65"/device:CPU:0*
dtype0
�
save/restore_shard_1NoOp^save/AssignVariableOp^save/AssignVariableOp_1^save/AssignVariableOp_10^save/AssignVariableOp_11^save/AssignVariableOp_12^save/AssignVariableOp_2^save/AssignVariableOp_3^save/AssignVariableOp_4^save/AssignVariableOp_5^save/AssignVariableOp_6^save/AssignVariableOp_7^save/AssignVariableOp_8^save/AssignVariableOp_9"/device:CPU:0
2
save/restore_all/NoOpNoOp^save/restore_shard
E
save/restore_all/NoOp_1NoOp^save/restore_shard_1"/device:CPU:0
J
save/restore_allNoOp^save/restore_all/NoOp^save/restore_all/NoOp_1"&?
save/Const:0save/Identity_52:0save/restore_all (5 @F8"�
trainable_variables��
�
Udnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0:0Zdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Assignidnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Read/ReadVariableOp:0"\
Ldnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights�  "�(2rdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Initializer/truncated_normal:08
�
Ydnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0:0^dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Assignmdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Read/ReadVariableOp:0"`
Pdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights�@  "�@(2vdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Initializer/truncated_normal:08
�
Wdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0:0\dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Assignkdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Read/ReadVariableOp:0"^
Ndnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights�  "�(2tdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Initializer/truncated_normal:08
�
!dnn/hiddenlayer_0/kernel/part_0:0&dnn/hiddenlayer_0/kernel/part_0/Assign5dnn/hiddenlayer_0/kernel/part_0/Read/ReadVariableOp:0"(
dnn/hiddenlayer_0/kernelz�  "z�(2<dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform:08
�
dnn/hiddenlayer_0/bias/part_0:0$dnn/hiddenlayer_0/bias/part_0/Assign3dnn/hiddenlayer_0/bias/part_0/Read/ReadVariableOp:0"#
dnn/hiddenlayer_0/bias� "�(21dnn/hiddenlayer_0/bias/part_0/Initializer/zeros:08
�
!dnn/hiddenlayer_1/kernel/part_0:0&dnn/hiddenlayer_1/kernel/part_0/Assign5dnn/hiddenlayer_1/kernel/part_0/Read/ReadVariableOp:0"*
dnn/hiddenlayer_1/kernel��  "��(2<dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform:08
�
dnn/hiddenlayer_1/bias/part_0:0$dnn/hiddenlayer_1/bias/part_0/Assign3dnn/hiddenlayer_1/bias/part_0/Read/ReadVariableOp:0"#
dnn/hiddenlayer_1/bias� "�(21dnn/hiddenlayer_1/bias/part_0/Initializer/zeros:08
�
!dnn/hiddenlayer_2/kernel/part_0:0&dnn/hiddenlayer_2/kernel/part_0/Assign5dnn/hiddenlayer_2/kernel/part_0/Read/ReadVariableOp:0"*
dnn/hiddenlayer_2/kernel��  "��(2<dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform:08
�
dnn/hiddenlayer_2/bias/part_0:0$dnn/hiddenlayer_2/bias/part_0/Assign3dnn/hiddenlayer_2/bias/part_0/Read/ReadVariableOp:0"#
dnn/hiddenlayer_2/bias� "�(21dnn/hiddenlayer_2/bias/part_0/Initializer/zeros:08
�
!dnn/hiddenlayer_3/kernel/part_0:0&dnn/hiddenlayer_3/kernel/part_0/Assign5dnn/hiddenlayer_3/kernel/part_0/Read/ReadVariableOp:0"*
dnn/hiddenlayer_3/kernel��  "��(2<dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform:08
�
dnn/hiddenlayer_3/bias/part_0:0$dnn/hiddenlayer_3/bias/part_0/Assign3dnn/hiddenlayer_3/bias/part_0/Read/ReadVariableOp:0"#
dnn/hiddenlayer_3/bias� "�(21dnn/hiddenlayer_3/bias/part_0/Initializer/zeros:08
�
dnn/logits/kernel/part_0:0dnn/logits/kernel/part_0/Assign.dnn/logits/kernel/part_0/Read/ReadVariableOp:0"!
dnn/logits/kernel�  "�(25dnn/logits/kernel/part_0/Initializer/random_uniform:08
�
dnn/logits/bias/part_0:0dnn/logits/bias/part_0/Assign,dnn/logits/bias/part_0/Read/ReadVariableOp:0"
dnn/logits/bias "(2*dnn/logits/bias/part_0/Initializer/zeros:08"�
	summaries�
�
/dnn/dnn/hiddenlayer_0/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_0/activation:0
/dnn/dnn/hiddenlayer_1/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_1/activation:0
/dnn/dnn/hiddenlayer_2/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_2/activation:0
/dnn/dnn/hiddenlayer_3/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_3/activation:0
(dnn/dnn/logits/fraction_of_zero_values:0
dnn/dnn/logits/activation:0"�
	variables��
Z
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0H
�
Udnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0:0Zdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Assignidnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Read/ReadVariableOp:0"\
Ldnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights�  "�(2rdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/part_0/Initializer/truncated_normal:08
�
Ydnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0:0^dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Assignmdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Read/ReadVariableOp:0"`
Pdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights�@  "�@(2vdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/part_0/Initializer/truncated_normal:08
�
Wdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0:0\dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Assignkdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Read/ReadVariableOp:0"^
Ndnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights�  "�(2tdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/part_0/Initializer/truncated_normal:08
�
!dnn/hiddenlayer_0/kernel/part_0:0&dnn/hiddenlayer_0/kernel/part_0/Assign5dnn/hiddenlayer_0/kernel/part_0/Read/ReadVariableOp:0"(
dnn/hiddenlayer_0/kernelz�  "z�(2<dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform:08
�
dnn/hiddenlayer_0/bias/part_0:0$dnn/hiddenlayer_0/bias/part_0/Assign3dnn/hiddenlayer_0/bias/part_0/Read/ReadVariableOp:0"#
dnn/hiddenlayer_0/bias� "�(21dnn/hiddenlayer_0/bias/part_0/Initializer/zeros:08
�
!dnn/hiddenlayer_1/kernel/part_0:0&dnn/hiddenlayer_1/kernel/part_0/Assign5dnn/hiddenlayer_1/kernel/part_0/Read/ReadVariableOp:0"*
dnn/hiddenlayer_1/kernel��  "��(2<dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform:08
�
dnn/hiddenlayer_1/bias/part_0:0$dnn/hiddenlayer_1/bias/part_0/Assign3dnn/hiddenlayer_1/bias/part_0/Read/ReadVariableOp:0"#
dnn/hiddenlayer_1/bias� "�(21dnn/hiddenlayer_1/bias/part_0/Initializer/zeros:08
�
!dnn/hiddenlayer_2/kernel/part_0:0&dnn/hiddenlayer_2/kernel/part_0/Assign5dnn/hiddenlayer_2/kernel/part_0/Read/ReadVariableOp:0"*
dnn/hiddenlayer_2/kernel��  "��(2<dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform:08
�
dnn/hiddenlayer_2/bias/part_0:0$dnn/hiddenlayer_2/bias/part_0/Assign3dnn/hiddenlayer_2/bias/part_0/Read/ReadVariableOp:0"#
dnn/hiddenlayer_2/bias� "�(21dnn/hiddenlayer_2/bias/part_0/Initializer/zeros:08
�
!dnn/hiddenlayer_3/kernel/part_0:0&dnn/hiddenlayer_3/kernel/part_0/Assign5dnn/hiddenlayer_3/kernel/part_0/Read/ReadVariableOp:0"*
dnn/hiddenlayer_3/kernel��  "��(2<dnn/hiddenlayer_3/kernel/part_0/Initializer/random_uniform:08
�
dnn/hiddenlayer_3/bias/part_0:0$dnn/hiddenlayer_3/bias/part_0/Assign3dnn/hiddenlayer_3/bias/part_0/Read/ReadVariableOp:0"#
dnn/hiddenlayer_3/bias� "�(21dnn/hiddenlayer_3/bias/part_0/Initializer/zeros:08
�
dnn/logits/kernel/part_0:0dnn/logits/kernel/part_0/Assign.dnn/logits/kernel/part_0/Read/ReadVariableOp:0"!
dnn/logits/kernel�  "�(25dnn/logits/kernel/part_0/Initializer/random_uniform:08
�
dnn/logits/bias/part_0:0dnn/logits/bias/part_0/Assign,dnn/logits/bias/part_0/Read/ReadVariableOp:0"
dnn/logits/bias "(2*dnn/logits/bias/part_0/Initializer/zeros:08"�
table_initializer�
�
qdnn/input_from_feature_columns/input_layer/meals_embedding/meals_lookup/hash_table/table_init/LookupTableImportV2
ydnn/input_from_feature_columns/input_layer/recipe_id_embedding/recipe_id_lookup/hash_table/table_init/LookupTableImportV2
udnn/input_from_feature_columns/input_layer/user_id_embedding/user_id_lookup/hash_table/table_init/LookupTableImportV2"m
global_step^\
Z
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0H"�7
cond_context�7�7
�
 dnn/zero_fraction/cond/cond_text dnn/zero_fraction/cond/pred_id:0!dnn/zero_fraction/cond/switch_t:0 *�
dnn/hiddenlayer_0/Sigmoid:0
dnn/zero_fraction/cond/Cast:0
+dnn/zero_fraction/cond/count_nonzero/Cast:0
,dnn/zero_fraction/cond/count_nonzero/Const:0
6dnn/zero_fraction/cond/count_nonzero/NotEqual/Switch:1
/dnn/zero_fraction/cond/count_nonzero/NotEqual:0
4dnn/zero_fraction/cond/count_nonzero/nonzero_count:0
,dnn/zero_fraction/cond/count_nonzero/zeros:0
 dnn/zero_fraction/cond/pred_id:0
!dnn/zero_fraction/cond/switch_t:0D
 dnn/zero_fraction/cond/pred_id:0 dnn/zero_fraction/cond/pred_id:0U
dnn/hiddenlayer_0/Sigmoid:06dnn/zero_fraction/cond/count_nonzero/NotEqual/Switch:1
�
"dnn/zero_fraction/cond/cond_text_1 dnn/zero_fraction/cond/pred_id:0!dnn/zero_fraction/cond/switch_f:0*�
dnn/hiddenlayer_0/Sigmoid:0
-dnn/zero_fraction/cond/count_nonzero_1/Cast:0
.dnn/zero_fraction/cond/count_nonzero_1/Const:0
8dnn/zero_fraction/cond/count_nonzero_1/NotEqual/Switch:0
1dnn/zero_fraction/cond/count_nonzero_1/NotEqual:0
6dnn/zero_fraction/cond/count_nonzero_1/nonzero_count:0
.dnn/zero_fraction/cond/count_nonzero_1/zeros:0
 dnn/zero_fraction/cond/pred_id:0
!dnn/zero_fraction/cond/switch_f:0W
dnn/hiddenlayer_0/Sigmoid:08dnn/zero_fraction/cond/count_nonzero_1/NotEqual/Switch:0D
 dnn/zero_fraction/cond/pred_id:0 dnn/zero_fraction/cond/pred_id:0
�
"dnn/zero_fraction_1/cond/cond_text"dnn/zero_fraction_1/cond/pred_id:0#dnn/zero_fraction_1/cond/switch_t:0 *�
dnn/hiddenlayer_1/Sigmoid:0
dnn/zero_fraction_1/cond/Cast:0
-dnn/zero_fraction_1/cond/count_nonzero/Cast:0
.dnn/zero_fraction_1/cond/count_nonzero/Const:0
8dnn/zero_fraction_1/cond/count_nonzero/NotEqual/Switch:1
1dnn/zero_fraction_1/cond/count_nonzero/NotEqual:0
6dnn/zero_fraction_1/cond/count_nonzero/nonzero_count:0
.dnn/zero_fraction_1/cond/count_nonzero/zeros:0
"dnn/zero_fraction_1/cond/pred_id:0
#dnn/zero_fraction_1/cond/switch_t:0W
dnn/hiddenlayer_1/Sigmoid:08dnn/zero_fraction_1/cond/count_nonzero/NotEqual/Switch:1H
"dnn/zero_fraction_1/cond/pred_id:0"dnn/zero_fraction_1/cond/pred_id:0
�
$dnn/zero_fraction_1/cond/cond_text_1"dnn/zero_fraction_1/cond/pred_id:0#dnn/zero_fraction_1/cond/switch_f:0*�
dnn/hiddenlayer_1/Sigmoid:0
/dnn/zero_fraction_1/cond/count_nonzero_1/Cast:0
0dnn/zero_fraction_1/cond/count_nonzero_1/Const:0
:dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual/Switch:0
3dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual:0
8dnn/zero_fraction_1/cond/count_nonzero_1/nonzero_count:0
0dnn/zero_fraction_1/cond/count_nonzero_1/zeros:0
"dnn/zero_fraction_1/cond/pred_id:0
#dnn/zero_fraction_1/cond/switch_f:0H
"dnn/zero_fraction_1/cond/pred_id:0"dnn/zero_fraction_1/cond/pred_id:0Y
dnn/hiddenlayer_1/Sigmoid:0:dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual/Switch:0
�
"dnn/zero_fraction_2/cond/cond_text"dnn/zero_fraction_2/cond/pred_id:0#dnn/zero_fraction_2/cond/switch_t:0 *�
dnn/hiddenlayer_2/Sigmoid:0
dnn/zero_fraction_2/cond/Cast:0
-dnn/zero_fraction_2/cond/count_nonzero/Cast:0
.dnn/zero_fraction_2/cond/count_nonzero/Const:0
8dnn/zero_fraction_2/cond/count_nonzero/NotEqual/Switch:1
1dnn/zero_fraction_2/cond/count_nonzero/NotEqual:0
6dnn/zero_fraction_2/cond/count_nonzero/nonzero_count:0
.dnn/zero_fraction_2/cond/count_nonzero/zeros:0
"dnn/zero_fraction_2/cond/pred_id:0
#dnn/zero_fraction_2/cond/switch_t:0H
"dnn/zero_fraction_2/cond/pred_id:0"dnn/zero_fraction_2/cond/pred_id:0W
dnn/hiddenlayer_2/Sigmoid:08dnn/zero_fraction_2/cond/count_nonzero/NotEqual/Switch:1
�
$dnn/zero_fraction_2/cond/cond_text_1"dnn/zero_fraction_2/cond/pred_id:0#dnn/zero_fraction_2/cond/switch_f:0*�
dnn/hiddenlayer_2/Sigmoid:0
/dnn/zero_fraction_2/cond/count_nonzero_1/Cast:0
0dnn/zero_fraction_2/cond/count_nonzero_1/Const:0
:dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual/Switch:0
3dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual:0
8dnn/zero_fraction_2/cond/count_nonzero_1/nonzero_count:0
0dnn/zero_fraction_2/cond/count_nonzero_1/zeros:0
"dnn/zero_fraction_2/cond/pred_id:0
#dnn/zero_fraction_2/cond/switch_f:0Y
dnn/hiddenlayer_2/Sigmoid:0:dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual/Switch:0H
"dnn/zero_fraction_2/cond/pred_id:0"dnn/zero_fraction_2/cond/pred_id:0
�
"dnn/zero_fraction_3/cond/cond_text"dnn/zero_fraction_3/cond/pred_id:0#dnn/zero_fraction_3/cond/switch_t:0 *�
dnn/hiddenlayer_3/Sigmoid:0
dnn/zero_fraction_3/cond/Cast:0
-dnn/zero_fraction_3/cond/count_nonzero/Cast:0
.dnn/zero_fraction_3/cond/count_nonzero/Const:0
8dnn/zero_fraction_3/cond/count_nonzero/NotEqual/Switch:1
1dnn/zero_fraction_3/cond/count_nonzero/NotEqual:0
6dnn/zero_fraction_3/cond/count_nonzero/nonzero_count:0
.dnn/zero_fraction_3/cond/count_nonzero/zeros:0
"dnn/zero_fraction_3/cond/pred_id:0
#dnn/zero_fraction_3/cond/switch_t:0W
dnn/hiddenlayer_3/Sigmoid:08dnn/zero_fraction_3/cond/count_nonzero/NotEqual/Switch:1H
"dnn/zero_fraction_3/cond/pred_id:0"dnn/zero_fraction_3/cond/pred_id:0
�
$dnn/zero_fraction_3/cond/cond_text_1"dnn/zero_fraction_3/cond/pred_id:0#dnn/zero_fraction_3/cond/switch_f:0*�
dnn/hiddenlayer_3/Sigmoid:0
/dnn/zero_fraction_3/cond/count_nonzero_1/Cast:0
0dnn/zero_fraction_3/cond/count_nonzero_1/Const:0
:dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual/Switch:0
3dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual:0
8dnn/zero_fraction_3/cond/count_nonzero_1/nonzero_count:0
0dnn/zero_fraction_3/cond/count_nonzero_1/zeros:0
"dnn/zero_fraction_3/cond/pred_id:0
#dnn/zero_fraction_3/cond/switch_f:0Y
dnn/hiddenlayer_3/Sigmoid:0:dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual/Switch:0H
"dnn/zero_fraction_3/cond/pred_id:0"dnn/zero_fraction_3/cond/pred_id:0
�
"dnn/zero_fraction_4/cond/cond_text"dnn/zero_fraction_4/cond/pred_id:0#dnn/zero_fraction_4/cond/switch_t:0 *�
dnn/logits/BiasAdd:0
dnn/zero_fraction_4/cond/Cast:0
-dnn/zero_fraction_4/cond/count_nonzero/Cast:0
.dnn/zero_fraction_4/cond/count_nonzero/Const:0
8dnn/zero_fraction_4/cond/count_nonzero/NotEqual/Switch:1
1dnn/zero_fraction_4/cond/count_nonzero/NotEqual:0
6dnn/zero_fraction_4/cond/count_nonzero/nonzero_count:0
.dnn/zero_fraction_4/cond/count_nonzero/zeros:0
"dnn/zero_fraction_4/cond/pred_id:0
#dnn/zero_fraction_4/cond/switch_t:0H
"dnn/zero_fraction_4/cond/pred_id:0"dnn/zero_fraction_4/cond/pred_id:0P
dnn/logits/BiasAdd:08dnn/zero_fraction_4/cond/count_nonzero/NotEqual/Switch:1
�
$dnn/zero_fraction_4/cond/cond_text_1"dnn/zero_fraction_4/cond/pred_id:0#dnn/zero_fraction_4/cond/switch_f:0*�
dnn/logits/BiasAdd:0
/dnn/zero_fraction_4/cond/count_nonzero_1/Cast:0
0dnn/zero_fraction_4/cond/count_nonzero_1/Const:0
:dnn/zero_fraction_4/cond/count_nonzero_1/NotEqual/Switch:0
3dnn/zero_fraction_4/cond/count_nonzero_1/NotEqual:0
8dnn/zero_fraction_4/cond/count_nonzero_1/nonzero_count:0
0dnn/zero_fraction_4/cond/count_nonzero_1/zeros:0
"dnn/zero_fraction_4/cond/pred_id:0
#dnn/zero_fraction_4/cond/switch_f:0H
"dnn/zero_fraction_4/cond/pred_id:0"dnn/zero_fraction_4/cond/pred_id:0R
dnn/logits/BiasAdd:0:dnn/zero_fraction_4/cond/count_nonzero_1/NotEqual/Switch:0"%
saved_model_main_op


group_deps*�

regression�
3
inputs)
input_example_tensor:0���������6
outputs+
dnn/logits/BiasAdd:0���������tensorflow/serving/regress*�
serving_default�
3
inputs)
input_example_tensor:0���������6
outputs+
dnn/logits/BiasAdd:0���������tensorflow/serving/regress*�
predict�
5
examples)
input_example_tensor:0���������:
predictions+
dnn/logits/BiasAdd:0���������tensorflow/serving/predict