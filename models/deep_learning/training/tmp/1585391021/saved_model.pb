��
�.�.
:
Add
x"T
y"T
z"T"
Ttype:
2	
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
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
�
ParseExampleV2

serialized	
names
sparse_keys

dense_keys
ragged_keys
dense_defaults2Tdense
sparse_indices	*
num_sparse
sparse_values2sparse_types
sparse_shapes	*
num_sparse
dense_values2Tdense#
ragged_values2ragged_value_types'
ragged_row_splits2ragged_split_types"
Tdense
list(type)(:
2	"

num_sparseint("%
sparse_types
list(type)(:
2	"+
ragged_value_types
list(type)(:
2	"*
ragged_split_types
list(type)(:
2	"
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
b
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:

2	
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
E
Relu
features"T
activations"T"
Ttype:
2	
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
StatelessIf
cond"Tcond
input2Tin
output2Tout"
Tcondtype"
Tin
list(type)("
Tout
list(type)("
then_branchfunc"
else_branchfunc" 
output_shapeslist(shape)
 
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
Ttype"serve*2.1.02v2.1.0-rc2-17-ge5bf8de8��

global_step/Initializer/zerosConst*
_class
loc:@global_step*
_output_shapes
: *
dtype0	*
value	B	 R 
�
global_stepVarHandleOp*
_class
loc:@global_step*
_output_shapes
: *
dtype0	*
shape: *
shared_nameglobal_step
g
,global_step/IsInitialized/VarIsInitializedOpVarIsInitializedOpglobal_step*
_output_shapes
: 
_
global_step/AssignAssignVariableOpglobal_stepglobal_step/Initializer/zeros*
dtype0	
c
global_step/Read/ReadVariableOpReadVariableOpglobal_step*
_output_shapes
: *
dtype0	
o
input_example_tensorPlaceholder*#
_output_shapes
:���������*
dtype0*
shape:���������
U
ParseExample/ConstConst*
_output_shapes
: *
dtype0	*
valueB	 
W
ParseExample/Const_1Const*
_output_shapes
: *
dtype0	*
valueB	 
W
ParseExample/Const_2Const*
_output_shapes
: *
dtype0	*
valueB	 
W
ParseExample/Const_3Const*
_output_shapes
: *
dtype0	*
valueB	 
d
!ParseExample/ParseExampleV2/namesConst*
_output_shapes
: *
dtype0*
valueB 
�
'ParseExample/ParseExampleV2/sparse_keysConst*
_output_shapes
:*
dtype0*.
value%B#BmealsB	recipe_idBuser_id
�
&ParseExample/ParseExampleV2/dense_keysConst*
_output_shapes
:*
dtype0*E
value<B:Buser_ageBuser_genderBuser_healthBuser_hobbies
j
'ParseExample/ParseExampleV2/ragged_keysConst*
_output_shapes
: *
dtype0*
valueB 
�
ParseExample/ParseExampleV2ParseExampleV2input_example_tensor!ParseExample/ParseExampleV2/names'ParseExample/ParseExampleV2/sparse_keys&ParseExample/ParseExampleV2/dense_keys'ParseExample/ParseExampleV2/ragged_keysParseExample/ConstParseExample/Const_1ParseExample/Const_2ParseExample/Const_3*
Tdense
2				*�
_output_shapes�
�:���������:���������:���������:���������:���������:���������::::���������:���������:���������:���������**
dense_shapes
::::*

num_sparse*
ragged_split_types
 *
ragged_value_types
 *
sparse_types
2			
�
odnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Initializer/truncated_normal/shapeConst*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*
_output_shapes
:*
dtype0*
valueB"�     
�
ndnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Initializer/truncated_normal/meanConst*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *    
�
pdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Initializer/truncated_normal/stddevConst*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *  �>
�
ydnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Initializer/truncated_normal/TruncatedNormalTruncatedNormalodnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Initializer/truncated_normal/shape*
T0*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*
_output_shapes
:	�*
dtype0
�
mdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Initializer/truncated_normal/mulMulydnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Initializer/truncated_normal/TruncatedNormalpdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Initializer/truncated_normal/stddev*
T0*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*
_output_shapes
:	�
�
idnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Initializer/truncated_normalAddmdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Initializer/truncated_normal/mulndnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Initializer/truncated_normal/mean*
T0*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*
_output_shapes
:	�
�
Ldnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weightsVarHandleOp*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*
_output_shapes
: *
dtype0*
shape:	�*]
shared_nameNLdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights
�
mdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/IsInitialized/VarIsInitializedOpVarIsInitializedOpLdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*
_output_shapes
: 
�
Sdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/AssignAssignVariableOpLdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weightsidnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Initializer/truncated_normal*
dtype0
�
`dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Read/ReadVariableOpReadVariableOpLdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*
_output_shapes
:	�*
dtype0
�
sdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Initializer/truncated_normal/shapeConst*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*
_output_shapes
:*
dtype0*
valueB"  @   
�
rdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Initializer/truncated_normal/meanConst*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *    
�
tdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Initializer/truncated_normal/stddevConst*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *   >
�
}dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Initializer/truncated_normal/TruncatedNormalTruncatedNormalsdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Initializer/truncated_normal/shape*
T0*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*
_output_shapes
:	�@*
dtype0
�
qdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Initializer/truncated_normal/mulMul}dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Initializer/truncated_normal/TruncatedNormaltdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Initializer/truncated_normal/stddev*
T0*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*
_output_shapes
:	�@
�
mdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Initializer/truncated_normalAddqdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Initializer/truncated_normal/mulrdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Initializer/truncated_normal/mean*
T0*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*
_output_shapes
:	�@
�
Pdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weightsVarHandleOp*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*
_output_shapes
: *
dtype0*
shape:	�@*a
shared_nameRPdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights
�
qdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/IsInitialized/VarIsInitializedOpVarIsInitializedOpPdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*
_output_shapes
: 
�
Wdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/AssignAssignVariableOpPdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weightsmdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Initializer/truncated_normal*
dtype0
�
ddnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Read/ReadVariableOpReadVariableOpPdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*
_output_shapes
:	�@*
dtype0
�
qdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Initializer/truncated_normal/shapeConst*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*
_output_shapes
:*
dtype0*
valueB"�     
�
pdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Initializer/truncated_normal/meanConst*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *    
�
rdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Initializer/truncated_normal/stddevConst*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *  �>
�
{dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Initializer/truncated_normal/TruncatedNormalTruncatedNormalqdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Initializer/truncated_normal/shape*
T0*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*
_output_shapes
:	�*
dtype0
�
odnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Initializer/truncated_normal/mulMul{dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Initializer/truncated_normal/TruncatedNormalrdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Initializer/truncated_normal/stddev*
T0*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*
_output_shapes
:	�
�
kdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Initializer/truncated_normalAddodnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Initializer/truncated_normal/mulpdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Initializer/truncated_normal/mean*
T0*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*
_output_shapes
:	�
�
Ndnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weightsVarHandleOp*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*
_output_shapes
: *
dtype0*
shape:	�*_
shared_namePNdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights
�
odnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/IsInitialized/VarIsInitializedOpVarIsInitializedOpNdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*
_output_shapes
: 
�
Udnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/AssignAssignVariableOpNdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weightskdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Initializer/truncated_normal*
dtype0
�
bdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Read/ReadVariableOpReadVariableOpNdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*
_output_shapes
:	�*
dtype0
� 
Odnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/ConstConst*
_output_shapes	
:�*
dtype0*�
value�B��"�                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                      	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  
�
Ndnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/SizeConst*
_output_shapes
: *
dtype0*
value
B :�
�
Udnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/range/startConst*
_output_shapes
: *
dtype0*
value	B : 
�
Udnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :
�
Odnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/rangeRangeUdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/range/startNdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/SizeUdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/range/delta*
_output_shapes	
:�
�
Ndnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/CastCastOdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/range*

DstT0	*

SrcT0*
_output_shapes	
:�
�
Ydnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/hash_table/CastCastOdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/Const*

DstT0	*

SrcT0*
_output_shapes	
:�
�
Zdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/hash_table/ConstConst*
_output_shapes
: *
dtype0	*
valueB	 R
���������
�
_dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/hash_table/hash_tableHashTableV2*
_output_shapes
: *
	key_dtype0	*@
shared_name1/hash_table_32bc5d9b-956a-4f99-8693-5c91f4a09ad8*
value_dtype0	
�
sdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/hash_table/table_init/LookupTableImportV2LookupTableImportV2_dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/hash_table/hash_tableYdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/hash_table/CastNdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/Cast*	
Tin0	*

Tout0	
�
`dnn/input_from_feature_columns/input_layer/meals_embedding_1/hash_table_Lookup/LookupTableFindV2LookupTableFindV2_dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/hash_table/hash_tableParseExample/ParseExampleV2:3Zdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/hash_table/Const*	
Tin0	*

Tout0	*#
_output_shapes
:���������
�
`dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Slice/beginConst*
_output_shapes
:*
dtype0*
valueB: 
�
_dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Slice/sizeConst*
_output_shapes
:*
dtype0*
valueB:
�
Zdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/SliceSliceParseExample/ParseExampleV2:6`dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Slice/begin_dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:
�
Zdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
�
Ydnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/ProdProdZdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/SliceZdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Const*
T0	*
_output_shapes
: 
�
ednn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GatherV2/indicesConst*
_output_shapes
: *
dtype0*
value	B :
�
bdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
�
]dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GatherV2GatherV2ParseExample/ParseExampleV2:6ednn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GatherV2/indicesbdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0	*
_output_shapes
: 
�
[dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Cast/xPackYdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Prod]dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GatherV2*
N*
T0	*
_output_shapes
:
�
bdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/SparseReshapeSparseReshapeParseExample/ParseExampleV2ParseExample/ParseExampleV2:6[dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Cast/x*-
_output_shapes
:���������:
�
kdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/SparseReshape/IdentityIdentity`dnn/input_from_feature_columns/input_layer/meals_embedding_1/hash_table_Lookup/LookupTableFindV2*
T0	*#
_output_shapes
:���������
�
cdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GreaterEqual/yConst*
_output_shapes
: *
dtype0	*
value	B	 R 
�
adnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GreaterEqualGreaterEqualkdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/SparseReshape/Identitycdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
Zdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/WhereWhereadnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GreaterEqual*'
_output_shapes
:���������
�
bdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
���������
�
\dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/ReshapeReshapeZdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Wherebdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Reshape/shape*
T0	*#
_output_shapes
:���������
�
ddnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
�
_dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GatherV2_1GatherV2bdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/SparseReshape\dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Reshapeddnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GatherV2_1/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:���������
�
ddnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GatherV2_2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
�
_dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GatherV2_2GatherV2kdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/SparseReshape/Identity\dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Reshapeddnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GatherV2_2/axis*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:���������
�
]dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/IdentityIdentityddnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:
�
ndnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/SparseFillEmptyRows/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
�
|dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRows_dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GatherV2_1_dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/GatherV2_2]dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Identityndnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:���������:���������:���������:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
�
zdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice|dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/strided_slice/stack�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
Index0*
T0	*#
_output_shapes
:���������*

begin_mask*
end_mask*
shrink_axis_mask
�
qdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/CastCastzdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:���������
�
sdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/UniqueUnique~dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*2
_output_shapes 
:���������:���������
�
}dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookupResourceGatherLdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weightssdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/Unique*
Tindices0	*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*'
_output_shapes
:���������*
dtype0
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity}dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mulMul�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity*
T0*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum/reduction_indicesConst*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*
_output_shapes
:*
dtype0*
valueB:
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SumSum�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum/reduction_indices*
T0*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*'
_output_shapes
:���������*
	keep_dims(
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater/yConst*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *    
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/GreaterGreater�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater/y*
T0*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/ShapeShape�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum*
T0*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*
_output_shapes
:
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/ConstConst*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *  �?
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_likeFill�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/Shape�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/Const*
T0*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SelectSelect�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like*
T0*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SqrtSqrt�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select*
T0*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select_1Select�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sqrt�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum*
T0*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1/yConst*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *  �@
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1Mul�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1/y*
T0*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum/yConst*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *  �@
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/MaximumMaximum�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select_1�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum/y*
T0*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/truedivRealDiv�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum*
T0*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_normIdentity�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/truediv*
T0*_
_classU
SQloc:@dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1Identity�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm*
T0*'
_output_shapes
:���������
�
ldnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparseSparseSegmentMean�dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1udnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/Unique:1qdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:���������
�
ddnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   
�
^dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Reshape_1Reshape~dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2ddnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Reshape_1/shape*
T0
*'
_output_shapes
:���������
�
Zdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/ShapeShapeldnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse*
T0*
_output_shapes
:
�
hdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
�
jdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
�
jdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
�
bdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/strided_sliceStridedSliceZdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Shapehdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/strided_slice/stackjdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/strided_slice/stack_1jdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
�
\dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/stack/0Const*
_output_shapes
: *
dtype0*
value	B :
�
Zdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/stackPack\dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/stack/0bdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/strided_slice*
N*
T0*
_output_shapes
:
�
Ydnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/TileTile^dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Reshape_1Zdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/stack*
T0
*0
_output_shapes
:������������������
�
_dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/zeros_like	ZerosLikeldnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
Tdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weightsSelectYdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Tile_dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/zeros_likeldnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
[dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Cast_1CastParseExample/ParseExampleV2:6*

DstT0*

SrcT0	*
_output_shapes
:
�
bdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Slice_1/beginConst*
_output_shapes
:*
dtype0*
valueB: 
�
adnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Slice_1/sizeConst*
_output_shapes
:*
dtype0*
valueB:
�
\dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Slice_1Slice[dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Cast_1bdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Slice_1/beginadnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
�
\dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Shape_1ShapeTdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights*
T0*
_output_shapes
:
�
bdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Slice_2/beginConst*
_output_shapes
:*
dtype0*
valueB:
�
adnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Slice_2/sizeConst*
_output_shapes
:*
dtype0*
valueB:
���������
�
\dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Slice_2Slice\dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Shape_1bdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Slice_2/beginadnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Slice_2/size*
Index0*
T0*
_output_shapes
:
�
`dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
�
[dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/concatConcatV2\dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Slice_1\dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Slice_2`dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/concat/axis*
N*
T0*
_output_shapes
:
�
^dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Reshape_2ReshapeTdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights[dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/concat*
T0*'
_output_shapes
:���������
�
Bdnn/input_from_feature_columns/input_layer/meals_embedding_1/ShapeShape^dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Reshape_2*
T0*
_output_shapes
:
�
Pdnn/input_from_feature_columns/input_layer/meals_embedding_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
�
Rdnn/input_from_feature_columns/input_layer/meals_embedding_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
�
Rdnn/input_from_feature_columns/input_layer/meals_embedding_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
�
Jdnn/input_from_feature_columns/input_layer/meals_embedding_1/strided_sliceStridedSliceBdnn/input_from_feature_columns/input_layer/meals_embedding_1/ShapePdnn/input_from_feature_columns/input_layer/meals_embedding_1/strided_slice/stackRdnn/input_from_feature_columns/input_layer/meals_embedding_1/strided_slice/stack_1Rdnn/input_from_feature_columns/input_layer/meals_embedding_1/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
�
Ldnn/input_from_feature_columns/input_layer/meals_embedding_1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
�
Jdnn/input_from_feature_columns/input_layer/meals_embedding_1/Reshape/shapePackJdnn/input_from_feature_columns/input_layer/meals_embedding_1/strided_sliceLdnn/input_from_feature_columns/input_layer/meals_embedding_1/Reshape/shape/1*
N*
T0*
_output_shapes
:
�
Ddnn/input_from_feature_columns/input_layer/meals_embedding_1/ReshapeReshape^dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_embedding_weights/Reshape_2Jdnn/input_from_feature_columns/input_layer/meals_embedding_1/Reshape/shape*
T0*'
_output_shapes
:���������
�j
Wdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/ConstConst*
_output_shapes	
:�*
dtype0*�i
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
                                
�
Vdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/SizeConst*
_output_shapes
: *
dtype0*
value
B :�
�
]dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/range/startConst*
_output_shapes
: *
dtype0*
value	B : 
�
]dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :
�
Wdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/rangeRange]dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/range/startVdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/Size]dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/range/delta*
_output_shapes	
:�
�
Vdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/CastCastWdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/range*

DstT0	*

SrcT0*
_output_shapes	
:�
�
adnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/hash_table/CastCastWdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/Const*

DstT0	*

SrcT0*
_output_shapes	
:�
�
bdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/hash_table/ConstConst*
_output_shapes
: *
dtype0	*
valueB	 R
���������
�
gdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/hash_table/hash_tableHashTableV2*
_output_shapes
: *
	key_dtype0	*@
shared_name1/hash_table_72760135-407c-4a20-b9fe-532a540aff65*
value_dtype0	
�
{dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/hash_table/table_init/LookupTableImportV2LookupTableImportV2gdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/hash_table/hash_tableadnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/hash_table/CastVdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/Cast*	
Tin0	*

Tout0	
�
ddnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/hash_table_Lookup/LookupTableFindV2LookupTableFindV2gdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/hash_table/hash_tableParseExample/ParseExampleV2:4bdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/hash_table/Const*	
Tin0	*

Tout0	*#
_output_shapes
:���������
�
hdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slice/beginConst*
_output_shapes
:*
dtype0*
valueB: 
�
gdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slice/sizeConst*
_output_shapes
:*
dtype0*
valueB:
�
bdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/SliceSliceParseExample/ParseExampleV2:7hdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slice/begingdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:
�
bdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
�
adnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/ProdProdbdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slicebdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Const*
T0	*
_output_shapes
: 
�
mdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GatherV2/indicesConst*
_output_shapes
: *
dtype0*
value	B :
�
jdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
�
ednn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GatherV2GatherV2ParseExample/ParseExampleV2:7mdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GatherV2/indicesjdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0	*
_output_shapes
: 
�
cdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Cast/xPackadnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Prodednn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GatherV2*
N*
T0	*
_output_shapes
:
�
jdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/SparseReshapeSparseReshapeParseExample/ParseExampleV2:1ParseExample/ParseExampleV2:7cdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Cast/x*-
_output_shapes
:���������:
�
sdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/SparseReshape/IdentityIdentityddnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/hash_table_Lookup/LookupTableFindV2*
T0	*#
_output_shapes
:���������
�
kdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GreaterEqual/yConst*
_output_shapes
: *
dtype0	*
value	B	 R 
�
idnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GreaterEqualGreaterEqualsdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/SparseReshape/Identitykdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
bdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/WhereWhereidnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GreaterEqual*'
_output_shapes
:���������
�
jdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
���������
�
ddnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/ReshapeReshapebdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Wherejdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Reshape/shape*
T0	*#
_output_shapes
:���������
�
ldnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
�
gdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GatherV2_1GatherV2jdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/SparseReshapeddnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Reshapeldnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GatherV2_1/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:���������
�
ldnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GatherV2_2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
�
gdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GatherV2_2GatherV2sdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/SparseReshape/Identityddnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Reshapeldnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GatherV2_2/axis*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:���������
�
ednn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/IdentityIdentityldnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:
�
vdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/SparseFillEmptyRows/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsgdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GatherV2_1gdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/GatherV2_2ednn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Identityvdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:���������:���������:���������:���������
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
Index0*
T0	*#
_output_shapes
:���������*

begin_mask*
end_mask*
shrink_axis_mask
�
ydnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/CastCast�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:���������
�
{dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/UniqueUnique�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*2
_output_shapes 
:���������:���������
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookupResourceGatherPdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights{dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/Unique*
Tindices0	*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*'
_output_shapes
:���������@*
dtype0
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*'
_output_shapes
:���������@
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mulMul�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity*
T0*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*'
_output_shapes
:���������@
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum/reduction_indicesConst*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*
_output_shapes
:*
dtype0*
valueB:
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SumSum�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum/reduction_indices*
T0*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*'
_output_shapes
:���������*
	keep_dims(
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater/yConst*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *    
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/GreaterGreater�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater/y*
T0*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/ShapeShape�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum*
T0*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*
_output_shapes
:
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/ConstConst*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *  �?
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_likeFill�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/Shape�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/Const*
T0*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SelectSelect�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like*
T0*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SqrtSqrt�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select*
T0*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select_1Select�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sqrt�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum*
T0*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1/yConst*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *   A
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1Mul�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1/y*
T0*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*'
_output_shapes
:���������@
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum/yConst*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *   A
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/MaximumMaximum�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select_1�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum/y*
T0*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/truedivRealDiv�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum*
T0*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*'
_output_shapes
:���������@
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_normIdentity�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/truediv*
T0*c
_classY
WUloc:@dnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights*'
_output_shapes
:���������@
�
�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1Identity�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm*
T0*'
_output_shapes
:���������@
�
tdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparseSparseSegmentMean�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1}dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/Unique:1ydnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:���������@
�
ldnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   
�
fdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Reshape_1Reshape�dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2ldnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Reshape_1/shape*
T0
*'
_output_shapes
:���������
�
bdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/ShapeShapetdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse*
T0*
_output_shapes
:
�
pdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
�
rdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
�
rdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
�
jdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/strided_sliceStridedSlicebdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Shapepdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/strided_slice/stackrdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/strided_slice/stack_1rdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
�
ddnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/stack/0Const*
_output_shapes
: *
dtype0*
value	B :
�
bdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/stackPackddnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/stack/0jdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/strided_slice*
N*
T0*
_output_shapes
:
�
adnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/TileTilefdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Reshape_1bdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/stack*
T0
*0
_output_shapes
:������������������
�
gdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/zeros_like	ZerosLiketdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������@
�
\dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weightsSelectadnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Tilegdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/zeros_liketdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������@
�
cdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Cast_1CastParseExample/ParseExampleV2:7*

DstT0*

SrcT0	*
_output_shapes
:
�
jdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slice_1/beginConst*
_output_shapes
:*
dtype0*
valueB: 
�
idnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slice_1/sizeConst*
_output_shapes
:*
dtype0*
valueB:
�
ddnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slice_1Slicecdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Cast_1jdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slice_1/beginidnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
�
ddnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Shape_1Shape\dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights*
T0*
_output_shapes
:
�
jdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slice_2/beginConst*
_output_shapes
:*
dtype0*
valueB:
�
idnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slice_2/sizeConst*
_output_shapes
:*
dtype0*
valueB:
���������
�
ddnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slice_2Sliceddnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Shape_1jdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slice_2/beginidnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slice_2/size*
Index0*
T0*
_output_shapes
:
�
hdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
�
cdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/concatConcatV2ddnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slice_1ddnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Slice_2hdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/concat/axis*
N*
T0*
_output_shapes
:
�
fdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Reshape_2Reshape\dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weightscdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/concat*
T0*'
_output_shapes
:���������@
�
Fdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/ShapeShapefdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Reshape_2*
T0*
_output_shapes
:
�
Tdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
�
Vdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
�
Vdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
�
Ndnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/strided_sliceStridedSliceFdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/ShapeTdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/strided_slice/stackVdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/strided_slice/stack_1Vdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
�
Pdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :@
�
Ndnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/Reshape/shapePackNdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/strided_slicePdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/Reshape/shape/1*
N*
T0*
_output_shapes
:
�
Hdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/ReshapeReshapefdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_embedding_weights/Reshape_2Ndnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/Reshape/shape*
T0*'
_output_shapes
:���������@
�
:dnn/input_from_feature_columns/input_layer/user_age_1/CastCastParseExample/ParseExampleV2:9*

DstT0*

SrcT0	*'
_output_shapes
:���������
�
;dnn/input_from_feature_columns/input_layer/user_age_1/ShapeShape:dnn/input_from_feature_columns/input_layer/user_age_1/Cast*
T0*
_output_shapes
:
�
Idnn/input_from_feature_columns/input_layer/user_age_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
�
Kdnn/input_from_feature_columns/input_layer/user_age_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
�
Kdnn/input_from_feature_columns/input_layer/user_age_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
�
Cdnn/input_from_feature_columns/input_layer/user_age_1/strided_sliceStridedSlice;dnn/input_from_feature_columns/input_layer/user_age_1/ShapeIdnn/input_from_feature_columns/input_layer/user_age_1/strided_slice/stackKdnn/input_from_feature_columns/input_layer/user_age_1/strided_slice/stack_1Kdnn/input_from_feature_columns/input_layer/user_age_1/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
�
Ednn/input_from_feature_columns/input_layer/user_age_1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
�
Cdnn/input_from_feature_columns/input_layer/user_age_1/Reshape/shapePackCdnn/input_from_feature_columns/input_layer/user_age_1/strided_sliceEdnn/input_from_feature_columns/input_layer/user_age_1/Reshape/shape/1*
N*
T0*
_output_shapes
:
�
=dnn/input_from_feature_columns/input_layer/user_age_1/ReshapeReshape:dnn/input_from_feature_columns/input_layer/user_age_1/CastCdnn/input_from_feature_columns/input_layer/user_age_1/Reshape/shape*
T0*'
_output_shapes
:���������
�
=dnn/input_from_feature_columns/input_layer/user_gender_1/CastCastParseExample/ParseExampleV2:10*

DstT0*

SrcT0	*'
_output_shapes
:���������
�
>dnn/input_from_feature_columns/input_layer/user_gender_1/ShapeShape=dnn/input_from_feature_columns/input_layer/user_gender_1/Cast*
T0*
_output_shapes
:
�
Ldnn/input_from_feature_columns/input_layer/user_gender_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
�
Ndnn/input_from_feature_columns/input_layer/user_gender_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
�
Ndnn/input_from_feature_columns/input_layer/user_gender_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
�
Fdnn/input_from_feature_columns/input_layer/user_gender_1/strided_sliceStridedSlice>dnn/input_from_feature_columns/input_layer/user_gender_1/ShapeLdnn/input_from_feature_columns/input_layer/user_gender_1/strided_slice/stackNdnn/input_from_feature_columns/input_layer/user_gender_1/strided_slice/stack_1Ndnn/input_from_feature_columns/input_layer/user_gender_1/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
�
Hdnn/input_from_feature_columns/input_layer/user_gender_1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
�
Fdnn/input_from_feature_columns/input_layer/user_gender_1/Reshape/shapePackFdnn/input_from_feature_columns/input_layer/user_gender_1/strided_sliceHdnn/input_from_feature_columns/input_layer/user_gender_1/Reshape/shape/1*
N*
T0*
_output_shapes
:
�
@dnn/input_from_feature_columns/input_layer/user_gender_1/ReshapeReshape=dnn/input_from_feature_columns/input_layer/user_gender_1/CastFdnn/input_from_feature_columns/input_layer/user_gender_1/Reshape/shape*
T0*'
_output_shapes
:���������
�
=dnn/input_from_feature_columns/input_layer/user_health_1/CastCastParseExample/ParseExampleV2:11*

DstT0*

SrcT0	*'
_output_shapes
:���������
�
>dnn/input_from_feature_columns/input_layer/user_health_1/ShapeShape=dnn/input_from_feature_columns/input_layer/user_health_1/Cast*
T0*
_output_shapes
:
�
Ldnn/input_from_feature_columns/input_layer/user_health_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
�
Ndnn/input_from_feature_columns/input_layer/user_health_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
�
Ndnn/input_from_feature_columns/input_layer/user_health_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
�
Fdnn/input_from_feature_columns/input_layer/user_health_1/strided_sliceStridedSlice>dnn/input_from_feature_columns/input_layer/user_health_1/ShapeLdnn/input_from_feature_columns/input_layer/user_health_1/strided_slice/stackNdnn/input_from_feature_columns/input_layer/user_health_1/strided_slice/stack_1Ndnn/input_from_feature_columns/input_layer/user_health_1/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
�
Hdnn/input_from_feature_columns/input_layer/user_health_1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
�
Fdnn/input_from_feature_columns/input_layer/user_health_1/Reshape/shapePackFdnn/input_from_feature_columns/input_layer/user_health_1/strided_sliceHdnn/input_from_feature_columns/input_layer/user_health_1/Reshape/shape/1*
N*
T0*
_output_shapes
:
�
@dnn/input_from_feature_columns/input_layer/user_health_1/ReshapeReshape=dnn/input_from_feature_columns/input_layer/user_health_1/CastFdnn/input_from_feature_columns/input_layer/user_health_1/Reshape/shape*
T0*'
_output_shapes
:���������
�
>dnn/input_from_feature_columns/input_layer/user_hobbies_1/CastCastParseExample/ParseExampleV2:12*

DstT0*

SrcT0	*'
_output_shapes
:���������
�
?dnn/input_from_feature_columns/input_layer/user_hobbies_1/ShapeShape>dnn/input_from_feature_columns/input_layer/user_hobbies_1/Cast*
T0*
_output_shapes
:
�
Mdnn/input_from_feature_columns/input_layer/user_hobbies_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
�
Odnn/input_from_feature_columns/input_layer/user_hobbies_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
�
Odnn/input_from_feature_columns/input_layer/user_hobbies_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
�
Gdnn/input_from_feature_columns/input_layer/user_hobbies_1/strided_sliceStridedSlice?dnn/input_from_feature_columns/input_layer/user_hobbies_1/ShapeMdnn/input_from_feature_columns/input_layer/user_hobbies_1/strided_slice/stackOdnn/input_from_feature_columns/input_layer/user_hobbies_1/strided_slice/stack_1Odnn/input_from_feature_columns/input_layer/user_hobbies_1/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
�
Idnn/input_from_feature_columns/input_layer/user_hobbies_1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
�
Gdnn/input_from_feature_columns/input_layer/user_hobbies_1/Reshape/shapePackGdnn/input_from_feature_columns/input_layer/user_hobbies_1/strided_sliceIdnn/input_from_feature_columns/input_layer/user_hobbies_1/Reshape/shape/1*
N*
T0*
_output_shapes
:
�
Adnn/input_from_feature_columns/input_layer/user_hobbies_1/ReshapeReshape>dnn/input_from_feature_columns/input_layer/user_hobbies_1/CastGdnn/input_from_feature_columns/input_layer/user_hobbies_1/Reshape/shape*
T0*'
_output_shapes
:���������
� 
Sdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/ConstConst*
_output_shapes	
:�*
dtype0*�
value�B��"�                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                      	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  
�
Rdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/SizeConst*
_output_shapes
: *
dtype0*
value
B :�
�
Ydnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/range/startConst*
_output_shapes
: *
dtype0*
value	B : 
�
Ydnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :
�
Sdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/rangeRangeYdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/range/startRdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/SizeYdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/range/delta*
_output_shapes	
:�
�
Rdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/CastCastSdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/range*

DstT0	*

SrcT0*
_output_shapes	
:�
�
]dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/hash_table/CastCastSdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/Const*

DstT0	*

SrcT0*
_output_shapes	
:�
�
^dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/hash_table/ConstConst*
_output_shapes
: *
dtype0	*
valueB	 R
���������
�
cdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/hash_table/hash_tableHashTableV2*
_output_shapes
: *
	key_dtype0	*@
shared_name1/hash_table_f27bf92e-4088-4e15-898b-7d17b8415982*
value_dtype0	
�
wdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/hash_table/table_init/LookupTableImportV2LookupTableImportV2cdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/hash_table/hash_table]dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/hash_table/CastRdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/Cast*	
Tin0	*

Tout0	
�
bdnn/input_from_feature_columns/input_layer/user_id_embedding_1/hash_table_Lookup/LookupTableFindV2LookupTableFindV2cdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/hash_table/hash_tableParseExample/ParseExampleV2:5^dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/hash_table/Const*	
Tin0	*

Tout0	*#
_output_shapes
:���������
�
ddnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice/beginConst*
_output_shapes
:*
dtype0*
valueB: 
�
cdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice/sizeConst*
_output_shapes
:*
dtype0*
valueB:
�
^dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/SliceSliceParseExample/ParseExampleV2:8ddnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice/begincdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:
�
^dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
�
]dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/ProdProd^dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice^dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Const*
T0	*
_output_shapes
: 
�
idnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GatherV2/indicesConst*
_output_shapes
: *
dtype0*
value	B :
�
fdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
�
adnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GatherV2GatherV2ParseExample/ParseExampleV2:8idnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GatherV2/indicesfdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0	*
_output_shapes
: 
�
_dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Cast/xPack]dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Prodadnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GatherV2*
N*
T0	*
_output_shapes
:
�
fdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/SparseReshapeSparseReshapeParseExample/ParseExampleV2:2ParseExample/ParseExampleV2:8_dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Cast/x*-
_output_shapes
:���������:
�
odnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/SparseReshape/IdentityIdentitybdnn/input_from_feature_columns/input_layer/user_id_embedding_1/hash_table_Lookup/LookupTableFindV2*
T0	*#
_output_shapes
:���������
�
gdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GreaterEqual/yConst*
_output_shapes
: *
dtype0	*
value	B	 R 
�
ednn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GreaterEqualGreaterEqualodnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/SparseReshape/Identitygdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
^dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/WhereWhereednn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GreaterEqual*'
_output_shapes
:���������
�
fdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
���������
�
`dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/ReshapeReshape^dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Wherefdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Reshape/shape*
T0	*#
_output_shapes
:���������
�
hdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
�
cdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GatherV2_1GatherV2fdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/SparseReshape`dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Reshapehdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GatherV2_1/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:���������
�
hdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GatherV2_2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
�
cdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GatherV2_2GatherV2odnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/SparseReshape/Identity`dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Reshapehdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GatherV2_2/axis*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:���������
�
adnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/IdentityIdentityhdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:
�
rdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/SparseFillEmptyRows/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowscdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GatherV2_1cdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/GatherV2_2adnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Identityrdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:���������:���������:���������:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
�
~dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
Index0*
T0	*#
_output_shapes
:���������*

begin_mask*
end_mask*
shrink_axis_mask
�
udnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/CastCast~dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/strided_slice*

DstT0*

SrcT0	*#
_output_shapes
:���������
�
wdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/UniqueUnique�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*2
_output_shapes 
:���������:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookupResourceGatherNdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weightswdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/Unique*
Tindices0	*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*'
_output_shapes
:���������*
dtype0
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mulMul�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity*
T0*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum/reduction_indicesConst*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*
_output_shapes
:*
dtype0*
valueB:
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SumSum�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum/reduction_indices*
T0*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*'
_output_shapes
:���������*
	keep_dims(
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater/yConst*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *    
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/GreaterGreater�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater/y*
T0*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/ShapeShape�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum*
T0*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*
_output_shapes
:
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/ConstConst*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *  �?
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_likeFill�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/Shape�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like/Const*
T0*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SelectSelect�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/ones_like*
T0*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/SqrtSqrt�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select*
T0*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select_1Select�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Greater�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sqrt�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Sum*
T0*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1/yConst*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *  �@
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1Mul�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1/y*
T0*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum/yConst*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *  �@
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/MaximumMaximum�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Select_1�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum/y*
T0*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/truedivRealDiv�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/mul_1�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/Maximum*
T0*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_normIdentity�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm/truediv*
T0*a
_classW
USloc:@dnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights*'
_output_shapes
:���������
�
�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1Identity�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/clip_by_norm*
T0*'
_output_shapes
:���������
�
pdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparseSparseSegmentMean�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1ydnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/Unique:1udnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:���������
�
hdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"����   
�
bdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Reshape_1Reshape�dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2hdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Reshape_1/shape*
T0
*'
_output_shapes
:���������
�
^dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/ShapeShapepdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse*
T0*
_output_shapes
:
�
ldnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
�
ndnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
�
ndnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
�
fdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/strided_sliceStridedSlice^dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Shapeldnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/strided_slice/stackndnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/strided_slice/stack_1ndnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
�
`dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/stack/0Const*
_output_shapes
: *
dtype0*
value	B :
�
^dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/stackPack`dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/stack/0fdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/strided_slice*
N*
T0*
_output_shapes
:
�
]dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/TileTilebdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Reshape_1^dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/stack*
T0
*0
_output_shapes
:������������������
�
cdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/zeros_like	ZerosLikepdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
Xdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weightsSelect]dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Tilecdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/zeros_likepdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
_dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Cast_1CastParseExample/ParseExampleV2:8*

DstT0*

SrcT0	*
_output_shapes
:
�
fdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice_1/beginConst*
_output_shapes
:*
dtype0*
valueB: 
�
ednn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice_1/sizeConst*
_output_shapes
:*
dtype0*
valueB:
�
`dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice_1Slice_dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Cast_1fdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice_1/beginednn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
�
`dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Shape_1ShapeXdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights*
T0*
_output_shapes
:
�
fdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice_2/beginConst*
_output_shapes
:*
dtype0*
valueB:
�
ednn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice_2/sizeConst*
_output_shapes
:*
dtype0*
valueB:
���������
�
`dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice_2Slice`dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Shape_1fdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice_2/beginednn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice_2/size*
Index0*
T0*
_output_shapes
:
�
ddnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
�
_dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/concatConcatV2`dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice_1`dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Slice_2ddnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/concat/axis*
N*
T0*
_output_shapes
:
�
bdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Reshape_2ReshapeXdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights_dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/concat*
T0*'
_output_shapes
:���������
�
Ddnn/input_from_feature_columns/input_layer/user_id_embedding_1/ShapeShapebdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Reshape_2*
T0*
_output_shapes
:
�
Rdnn/input_from_feature_columns/input_layer/user_id_embedding_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
�
Tdnn/input_from_feature_columns/input_layer/user_id_embedding_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
�
Tdnn/input_from_feature_columns/input_layer/user_id_embedding_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
�
Ldnn/input_from_feature_columns/input_layer/user_id_embedding_1/strided_sliceStridedSliceDdnn/input_from_feature_columns/input_layer/user_id_embedding_1/ShapeRdnn/input_from_feature_columns/input_layer/user_id_embedding_1/strided_slice/stackTdnn/input_from_feature_columns/input_layer/user_id_embedding_1/strided_slice/stack_1Tdnn/input_from_feature_columns/input_layer/user_id_embedding_1/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
�
Ndnn/input_from_feature_columns/input_layer/user_id_embedding_1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
�
Ldnn/input_from_feature_columns/input_layer/user_id_embedding_1/Reshape/shapePackLdnn/input_from_feature_columns/input_layer/user_id_embedding_1/strided_sliceNdnn/input_from_feature_columns/input_layer/user_id_embedding_1/Reshape/shape/1*
N*
T0*
_output_shapes
:
�
Fdnn/input_from_feature_columns/input_layer/user_id_embedding_1/ReshapeReshapebdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_embedding_weights/Reshape_2Ldnn/input_from_feature_columns/input_layer/user_id_embedding_1/Reshape/shape*
T0*'
_output_shapes
:���������
�
6dnn/input_from_feature_columns/input_layer/concat/axisConst*
_output_shapes
: *
dtype0*
valueB :
���������
�
1dnn/input_from_feature_columns/input_layer/concatConcatV2Ddnn/input_from_feature_columns/input_layer/meals_embedding_1/ReshapeHdnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/Reshape=dnn/input_from_feature_columns/input_layer/user_age_1/Reshape@dnn/input_from_feature_columns/input_layer/user_gender_1/Reshape@dnn/input_from_feature_columns/input_layer/user_health_1/ReshapeAdnn/input_from_feature_columns/input_layer/user_hobbies_1/ReshapeFdnn/input_from_feature_columns/input_layer/user_id_embedding_1/Reshape6dnn/input_from_feature_columns/input_layer/concat/axis*
N*
T0*'
_output_shapes
:���������z
�
9dnn/hiddenlayer_0/kernel/Initializer/random_uniform/shapeConst*+
_class!
loc:@dnn/hiddenlayer_0/kernel*
_output_shapes
:*
dtype0*
valueB"z      
�
7dnn/hiddenlayer_0/kernel/Initializer/random_uniform/minConst*+
_class!
loc:@dnn/hiddenlayer_0/kernel*
_output_shapes
: *
dtype0*
valueB
 *
�
�
7dnn/hiddenlayer_0/kernel/Initializer/random_uniform/maxConst*+
_class!
loc:@dnn/hiddenlayer_0/kernel*
_output_shapes
: *
dtype0*
valueB
 *
>
�
Adnn/hiddenlayer_0/kernel/Initializer/random_uniform/RandomUniformRandomUniform9dnn/hiddenlayer_0/kernel/Initializer/random_uniform/shape*
T0*+
_class!
loc:@dnn/hiddenlayer_0/kernel*
_output_shapes
:	z�*
dtype0
�
7dnn/hiddenlayer_0/kernel/Initializer/random_uniform/subSub7dnn/hiddenlayer_0/kernel/Initializer/random_uniform/max7dnn/hiddenlayer_0/kernel/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/hiddenlayer_0/kernel*
_output_shapes
: 
�
7dnn/hiddenlayer_0/kernel/Initializer/random_uniform/mulMulAdnn/hiddenlayer_0/kernel/Initializer/random_uniform/RandomUniform7dnn/hiddenlayer_0/kernel/Initializer/random_uniform/sub*
T0*+
_class!
loc:@dnn/hiddenlayer_0/kernel*
_output_shapes
:	z�
�
3dnn/hiddenlayer_0/kernel/Initializer/random_uniformAdd7dnn/hiddenlayer_0/kernel/Initializer/random_uniform/mul7dnn/hiddenlayer_0/kernel/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/hiddenlayer_0/kernel*
_output_shapes
:	z�
�
dnn/hiddenlayer_0/kernelVarHandleOp*+
_class!
loc:@dnn/hiddenlayer_0/kernel*
_output_shapes
: *
dtype0*
shape:	z�*)
shared_namednn/hiddenlayer_0/kernel
�
9dnn/hiddenlayer_0/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/kernel*
_output_shapes
: 
�
dnn/hiddenlayer_0/kernel/AssignAssignVariableOpdnn/hiddenlayer_0/kernel3dnn/hiddenlayer_0/kernel/Initializer/random_uniform*
dtype0
�
,dnn/hiddenlayer_0/kernel/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel*
_output_shapes
:	z�*
dtype0
�
(dnn/hiddenlayer_0/bias/Initializer/zerosConst*)
_class
loc:@dnn/hiddenlayer_0/bias*
_output_shapes	
:�*
dtype0*
valueB�*    
�
dnn/hiddenlayer_0/biasVarHandleOp*)
_class
loc:@dnn/hiddenlayer_0/bias*
_output_shapes
: *
dtype0*
shape:�*'
shared_namednn/hiddenlayer_0/bias
}
7dnn/hiddenlayer_0/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/bias*
_output_shapes
: 
�
dnn/hiddenlayer_0/bias/AssignAssignVariableOpdnn/hiddenlayer_0/bias(dnn/hiddenlayer_0/bias/Initializer/zeros*
dtype0
~
*dnn/hiddenlayer_0/bias/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias*
_output_shapes	
:�*
dtype0
�
'dnn/hiddenlayer_0/MatMul/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel*
_output_shapes
:	z�*
dtype0
�
dnn/hiddenlayer_0/MatMulMatMul1dnn/input_from_feature_columns/input_layer/concat'dnn/hiddenlayer_0/MatMul/ReadVariableOp*
T0*(
_output_shapes
:����������
|
(dnn/hiddenlayer_0/BiasAdd/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias*
_output_shapes	
:�*
dtype0
�
dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMul(dnn/hiddenlayer_0/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:����������
l
dnn/hiddenlayer_0/ReluReludnn/hiddenlayer_0/BiasAdd*
T0*(
_output_shapes
:����������
g
dnn/zero_fraction/SizeSizednn/hiddenlayer_0/Relu*
T0*
_output_shapes
: *
out_type0	
c
dnn/zero_fraction/LessEqual/yConst*
_output_shapes
: *
dtype0	*
valueB	 R����
�
dnn/zero_fraction/LessEqual	LessEqualdnn/zero_fraction/Sizednn/zero_fraction/LessEqual/y*
T0	*
_output_shapes
: 
�
dnn/zero_fraction/condStatelessIfdnn/zero_fraction/LessEqualdnn/hiddenlayer_0/Relu*
Tcond0
*
Tin
2*
Tout

2	*
_lower_using_switch_merge(* 
_output_shapes
: : : : : : *5
else_branch&R$
"dnn_zero_fraction_cond_false_93249*
output_shapes
: : : : : : *4
then_branch%R#
!dnn_zero_fraction_cond_true_93248
d
dnn/zero_fraction/cond/IdentityIdentitydnn/zero_fraction/cond*
T0	*
_output_shapes
: 
h
!dnn/zero_fraction/cond/Identity_1Identitydnn/zero_fraction/cond:1*
T0*
_output_shapes
: 
h
!dnn/zero_fraction/cond/Identity_2Identitydnn/zero_fraction/cond:2*
T0*
_output_shapes
: 
h
!dnn/zero_fraction/cond/Identity_3Identitydnn/zero_fraction/cond:3*
T0*
_output_shapes
: 
h
!dnn/zero_fraction/cond/Identity_4Identitydnn/zero_fraction/cond:4*
T0*
_output_shapes
: 
h
!dnn/zero_fraction/cond/Identity_5Identitydnn/zero_fraction/cond:5*
T0*
_output_shapes
: 
�
(dnn/zero_fraction/counts_to_fraction/subSubdnn/zero_fraction/Sizednn/zero_fraction/cond/Identity*
T0	*
_output_shapes
: 
�
)dnn/zero_fraction/counts_to_fraction/CastCast(dnn/zero_fraction/counts_to_fraction/sub*

DstT0*

SrcT0	*
_output_shapes
: 
{
+dnn/zero_fraction/counts_to_fraction/Cast_1Castdnn/zero_fraction/Size*

DstT0*

SrcT0	*
_output_shapes
: 
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
.dnn/hiddenlayer_0/fraction_of_zero_values/tagsConst*
_output_shapes
: *
dtype0*:
value1B/ B)dnn/hiddenlayer_0/fraction_of_zero_values
�
)dnn/hiddenlayer_0/fraction_of_zero_valuesScalarSummary.dnn/hiddenlayer_0/fraction_of_zero_values/tagsdnn/zero_fraction/fraction*
T0*
_output_shapes
: 
}
 dnn/hiddenlayer_0/activation/tagConst*
_output_shapes
: *
dtype0*-
value$B" Bdnn/hiddenlayer_0/activation
�
dnn/hiddenlayer_0/activationHistogramSummary dnn/hiddenlayer_0/activation/tagdnn/hiddenlayer_0/Relu*
_output_shapes
: 
�
9dnn/hiddenlayer_1/kernel/Initializer/random_uniform/shapeConst*+
_class!
loc:@dnn/hiddenlayer_1/kernel*
_output_shapes
:*
dtype0*
valueB"      
�
7dnn/hiddenlayer_1/kernel/Initializer/random_uniform/minConst*+
_class!
loc:@dnn/hiddenlayer_1/kernel*
_output_shapes
: *
dtype0*
valueB
 *׳ݽ
�
7dnn/hiddenlayer_1/kernel/Initializer/random_uniform/maxConst*+
_class!
loc:@dnn/hiddenlayer_1/kernel*
_output_shapes
: *
dtype0*
valueB
 *׳�=
�
Adnn/hiddenlayer_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform9dnn/hiddenlayer_1/kernel/Initializer/random_uniform/shape*
T0*+
_class!
loc:@dnn/hiddenlayer_1/kernel* 
_output_shapes
:
��*
dtype0
�
7dnn/hiddenlayer_1/kernel/Initializer/random_uniform/subSub7dnn/hiddenlayer_1/kernel/Initializer/random_uniform/max7dnn/hiddenlayer_1/kernel/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/hiddenlayer_1/kernel*
_output_shapes
: 
�
7dnn/hiddenlayer_1/kernel/Initializer/random_uniform/mulMulAdnn/hiddenlayer_1/kernel/Initializer/random_uniform/RandomUniform7dnn/hiddenlayer_1/kernel/Initializer/random_uniform/sub*
T0*+
_class!
loc:@dnn/hiddenlayer_1/kernel* 
_output_shapes
:
��
�
3dnn/hiddenlayer_1/kernel/Initializer/random_uniformAdd7dnn/hiddenlayer_1/kernel/Initializer/random_uniform/mul7dnn/hiddenlayer_1/kernel/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/hiddenlayer_1/kernel* 
_output_shapes
:
��
�
dnn/hiddenlayer_1/kernelVarHandleOp*+
_class!
loc:@dnn/hiddenlayer_1/kernel*
_output_shapes
: *
dtype0*
shape:
��*)
shared_namednn/hiddenlayer_1/kernel
�
9dnn/hiddenlayer_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_1/kernel*
_output_shapes
: 
�
dnn/hiddenlayer_1/kernel/AssignAssignVariableOpdnn/hiddenlayer_1/kernel3dnn/hiddenlayer_1/kernel/Initializer/random_uniform*
dtype0
�
,dnn/hiddenlayer_1/kernel/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel* 
_output_shapes
:
��*
dtype0
�
(dnn/hiddenlayer_1/bias/Initializer/zerosConst*)
_class
loc:@dnn/hiddenlayer_1/bias*
_output_shapes	
:�*
dtype0*
valueB�*    
�
dnn/hiddenlayer_1/biasVarHandleOp*)
_class
loc:@dnn/hiddenlayer_1/bias*
_output_shapes
: *
dtype0*
shape:�*'
shared_namednn/hiddenlayer_1/bias
}
7dnn/hiddenlayer_1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_1/bias*
_output_shapes
: 
�
dnn/hiddenlayer_1/bias/AssignAssignVariableOpdnn/hiddenlayer_1/bias(dnn/hiddenlayer_1/bias/Initializer/zeros*
dtype0
~
*dnn/hiddenlayer_1/bias/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias*
_output_shapes	
:�*
dtype0
�
'dnn/hiddenlayer_1/MatMul/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel* 
_output_shapes
:
��*
dtype0
�
dnn/hiddenlayer_1/MatMulMatMuldnn/hiddenlayer_0/Relu'dnn/hiddenlayer_1/MatMul/ReadVariableOp*
T0*(
_output_shapes
:����������
|
(dnn/hiddenlayer_1/BiasAdd/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias*
_output_shapes	
:�*
dtype0
�
dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMul(dnn/hiddenlayer_1/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:����������
l
dnn/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*
T0*(
_output_shapes
:����������
i
dnn/zero_fraction_1/SizeSizednn/hiddenlayer_1/Relu*
T0*
_output_shapes
: *
out_type0	
e
dnn/zero_fraction_1/LessEqual/yConst*
_output_shapes
: *
dtype0	*
valueB	 R����
�
dnn/zero_fraction_1/LessEqual	LessEqualdnn/zero_fraction_1/Sizednn/zero_fraction_1/LessEqual/y*
T0	*
_output_shapes
: 
�
dnn/zero_fraction_1/condStatelessIfdnn/zero_fraction_1/LessEqualdnn/hiddenlayer_1/Relu*
Tcond0
*
Tin
2*
Tout

2	*
_lower_using_switch_merge(* 
_output_shapes
: : : : : : *7
else_branch(R&
$dnn_zero_fraction_1_cond_false_93319*
output_shapes
: : : : : : *6
then_branch'R%
#dnn_zero_fraction_1_cond_true_93318
h
!dnn/zero_fraction_1/cond/IdentityIdentitydnn/zero_fraction_1/cond*
T0	*
_output_shapes
: 
l
#dnn/zero_fraction_1/cond/Identity_1Identitydnn/zero_fraction_1/cond:1*
T0*
_output_shapes
: 
l
#dnn/zero_fraction_1/cond/Identity_2Identitydnn/zero_fraction_1/cond:2*
T0*
_output_shapes
: 
l
#dnn/zero_fraction_1/cond/Identity_3Identitydnn/zero_fraction_1/cond:3*
T0*
_output_shapes
: 
l
#dnn/zero_fraction_1/cond/Identity_4Identitydnn/zero_fraction_1/cond:4*
T0*
_output_shapes
: 
l
#dnn/zero_fraction_1/cond/Identity_5Identitydnn/zero_fraction_1/cond:5*
T0*
_output_shapes
: 
�
*dnn/zero_fraction_1/counts_to_fraction/subSubdnn/zero_fraction_1/Size!dnn/zero_fraction_1/cond/Identity*
T0	*
_output_shapes
: 
�
+dnn/zero_fraction_1/counts_to_fraction/CastCast*dnn/zero_fraction_1/counts_to_fraction/sub*

DstT0*

SrcT0	*
_output_shapes
: 

-dnn/zero_fraction_1/counts_to_fraction/Cast_1Castdnn/zero_fraction_1/Size*

DstT0*

SrcT0	*
_output_shapes
: 
�
.dnn/zero_fraction_1/counts_to_fraction/truedivRealDiv+dnn/zero_fraction_1/counts_to_fraction/Cast-dnn/zero_fraction_1/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
y
dnn/zero_fraction_1/fractionIdentity.dnn/zero_fraction_1/counts_to_fraction/truediv*
T0*
_output_shapes
: 
�
.dnn/hiddenlayer_1/fraction_of_zero_values/tagsConst*
_output_shapes
: *
dtype0*:
value1B/ B)dnn/hiddenlayer_1/fraction_of_zero_values
�
)dnn/hiddenlayer_1/fraction_of_zero_valuesScalarSummary.dnn/hiddenlayer_1/fraction_of_zero_values/tagsdnn/zero_fraction_1/fraction*
T0*
_output_shapes
: 
}
 dnn/hiddenlayer_1/activation/tagConst*
_output_shapes
: *
dtype0*-
value$B" Bdnn/hiddenlayer_1/activation
�
dnn/hiddenlayer_1/activationHistogramSummary dnn/hiddenlayer_1/activation/tagdnn/hiddenlayer_1/Relu*
_output_shapes
: 
�
9dnn/hiddenlayer_2/kernel/Initializer/random_uniform/shapeConst*+
_class!
loc:@dnn/hiddenlayer_2/kernel*
_output_shapes
:*
dtype0*
valueB"      
�
7dnn/hiddenlayer_2/kernel/Initializer/random_uniform/minConst*+
_class!
loc:@dnn/hiddenlayer_2/kernel*
_output_shapes
: *
dtype0*
valueB
 *׳ݽ
�
7dnn/hiddenlayer_2/kernel/Initializer/random_uniform/maxConst*+
_class!
loc:@dnn/hiddenlayer_2/kernel*
_output_shapes
: *
dtype0*
valueB
 *׳�=
�
Adnn/hiddenlayer_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform9dnn/hiddenlayer_2/kernel/Initializer/random_uniform/shape*
T0*+
_class!
loc:@dnn/hiddenlayer_2/kernel* 
_output_shapes
:
��*
dtype0
�
7dnn/hiddenlayer_2/kernel/Initializer/random_uniform/subSub7dnn/hiddenlayer_2/kernel/Initializer/random_uniform/max7dnn/hiddenlayer_2/kernel/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/hiddenlayer_2/kernel*
_output_shapes
: 
�
7dnn/hiddenlayer_2/kernel/Initializer/random_uniform/mulMulAdnn/hiddenlayer_2/kernel/Initializer/random_uniform/RandomUniform7dnn/hiddenlayer_2/kernel/Initializer/random_uniform/sub*
T0*+
_class!
loc:@dnn/hiddenlayer_2/kernel* 
_output_shapes
:
��
�
3dnn/hiddenlayer_2/kernel/Initializer/random_uniformAdd7dnn/hiddenlayer_2/kernel/Initializer/random_uniform/mul7dnn/hiddenlayer_2/kernel/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/hiddenlayer_2/kernel* 
_output_shapes
:
��
�
dnn/hiddenlayer_2/kernelVarHandleOp*+
_class!
loc:@dnn/hiddenlayer_2/kernel*
_output_shapes
: *
dtype0*
shape:
��*)
shared_namednn/hiddenlayer_2/kernel
�
9dnn/hiddenlayer_2/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_2/kernel*
_output_shapes
: 
�
dnn/hiddenlayer_2/kernel/AssignAssignVariableOpdnn/hiddenlayer_2/kernel3dnn/hiddenlayer_2/kernel/Initializer/random_uniform*
dtype0
�
,dnn/hiddenlayer_2/kernel/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel* 
_output_shapes
:
��*
dtype0
�
(dnn/hiddenlayer_2/bias/Initializer/zerosConst*)
_class
loc:@dnn/hiddenlayer_2/bias*
_output_shapes	
:�*
dtype0*
valueB�*    
�
dnn/hiddenlayer_2/biasVarHandleOp*)
_class
loc:@dnn/hiddenlayer_2/bias*
_output_shapes
: *
dtype0*
shape:�*'
shared_namednn/hiddenlayer_2/bias
}
7dnn/hiddenlayer_2/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_2/bias*
_output_shapes
: 
�
dnn/hiddenlayer_2/bias/AssignAssignVariableOpdnn/hiddenlayer_2/bias(dnn/hiddenlayer_2/bias/Initializer/zeros*
dtype0
~
*dnn/hiddenlayer_2/bias/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias*
_output_shapes	
:�*
dtype0
�
'dnn/hiddenlayer_2/MatMul/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel* 
_output_shapes
:
��*
dtype0
�
dnn/hiddenlayer_2/MatMulMatMuldnn/hiddenlayer_1/Relu'dnn/hiddenlayer_2/MatMul/ReadVariableOp*
T0*(
_output_shapes
:����������
|
(dnn/hiddenlayer_2/BiasAdd/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias*
_output_shapes	
:�*
dtype0
�
dnn/hiddenlayer_2/BiasAddBiasAdddnn/hiddenlayer_2/MatMul(dnn/hiddenlayer_2/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:����������
l
dnn/hiddenlayer_2/ReluReludnn/hiddenlayer_2/BiasAdd*
T0*(
_output_shapes
:����������
i
dnn/zero_fraction_2/SizeSizednn/hiddenlayer_2/Relu*
T0*
_output_shapes
: *
out_type0	
e
dnn/zero_fraction_2/LessEqual/yConst*
_output_shapes
: *
dtype0	*
valueB	 R����
�
dnn/zero_fraction_2/LessEqual	LessEqualdnn/zero_fraction_2/Sizednn/zero_fraction_2/LessEqual/y*
T0	*
_output_shapes
: 
�
dnn/zero_fraction_2/condStatelessIfdnn/zero_fraction_2/LessEqualdnn/hiddenlayer_2/Relu*
Tcond0
*
Tin
2*
Tout

2	*
_lower_using_switch_merge(* 
_output_shapes
: : : : : : *7
else_branch(R&
$dnn_zero_fraction_2_cond_false_93389*
output_shapes
: : : : : : *6
then_branch'R%
#dnn_zero_fraction_2_cond_true_93388
h
!dnn/zero_fraction_2/cond/IdentityIdentitydnn/zero_fraction_2/cond*
T0	*
_output_shapes
: 
l
#dnn/zero_fraction_2/cond/Identity_1Identitydnn/zero_fraction_2/cond:1*
T0*
_output_shapes
: 
l
#dnn/zero_fraction_2/cond/Identity_2Identitydnn/zero_fraction_2/cond:2*
T0*
_output_shapes
: 
l
#dnn/zero_fraction_2/cond/Identity_3Identitydnn/zero_fraction_2/cond:3*
T0*
_output_shapes
: 
l
#dnn/zero_fraction_2/cond/Identity_4Identitydnn/zero_fraction_2/cond:4*
T0*
_output_shapes
: 
l
#dnn/zero_fraction_2/cond/Identity_5Identitydnn/zero_fraction_2/cond:5*
T0*
_output_shapes
: 
�
*dnn/zero_fraction_2/counts_to_fraction/subSubdnn/zero_fraction_2/Size!dnn/zero_fraction_2/cond/Identity*
T0	*
_output_shapes
: 
�
+dnn/zero_fraction_2/counts_to_fraction/CastCast*dnn/zero_fraction_2/counts_to_fraction/sub*

DstT0*

SrcT0	*
_output_shapes
: 

-dnn/zero_fraction_2/counts_to_fraction/Cast_1Castdnn/zero_fraction_2/Size*

DstT0*

SrcT0	*
_output_shapes
: 
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
.dnn/hiddenlayer_2/fraction_of_zero_values/tagsConst*
_output_shapes
: *
dtype0*:
value1B/ B)dnn/hiddenlayer_2/fraction_of_zero_values
�
)dnn/hiddenlayer_2/fraction_of_zero_valuesScalarSummary.dnn/hiddenlayer_2/fraction_of_zero_values/tagsdnn/zero_fraction_2/fraction*
T0*
_output_shapes
: 
}
 dnn/hiddenlayer_2/activation/tagConst*
_output_shapes
: *
dtype0*-
value$B" Bdnn/hiddenlayer_2/activation
�
dnn/hiddenlayer_2/activationHistogramSummary dnn/hiddenlayer_2/activation/tagdnn/hiddenlayer_2/Relu*
_output_shapes
: 
�
9dnn/hiddenlayer_3/kernel/Initializer/random_uniform/shapeConst*+
_class!
loc:@dnn/hiddenlayer_3/kernel*
_output_shapes
:*
dtype0*
valueB"   �   
�
7dnn/hiddenlayer_3/kernel/Initializer/random_uniform/minConst*+
_class!
loc:@dnn/hiddenlayer_3/kernel*
_output_shapes
: *
dtype0*
valueB
 *   �
�
7dnn/hiddenlayer_3/kernel/Initializer/random_uniform/maxConst*+
_class!
loc:@dnn/hiddenlayer_3/kernel*
_output_shapes
: *
dtype0*
valueB
 *   >
�
Adnn/hiddenlayer_3/kernel/Initializer/random_uniform/RandomUniformRandomUniform9dnn/hiddenlayer_3/kernel/Initializer/random_uniform/shape*
T0*+
_class!
loc:@dnn/hiddenlayer_3/kernel* 
_output_shapes
:
��*
dtype0
�
7dnn/hiddenlayer_3/kernel/Initializer/random_uniform/subSub7dnn/hiddenlayer_3/kernel/Initializer/random_uniform/max7dnn/hiddenlayer_3/kernel/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/hiddenlayer_3/kernel*
_output_shapes
: 
�
7dnn/hiddenlayer_3/kernel/Initializer/random_uniform/mulMulAdnn/hiddenlayer_3/kernel/Initializer/random_uniform/RandomUniform7dnn/hiddenlayer_3/kernel/Initializer/random_uniform/sub*
T0*+
_class!
loc:@dnn/hiddenlayer_3/kernel* 
_output_shapes
:
��
�
3dnn/hiddenlayer_3/kernel/Initializer/random_uniformAdd7dnn/hiddenlayer_3/kernel/Initializer/random_uniform/mul7dnn/hiddenlayer_3/kernel/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/hiddenlayer_3/kernel* 
_output_shapes
:
��
�
dnn/hiddenlayer_3/kernelVarHandleOp*+
_class!
loc:@dnn/hiddenlayer_3/kernel*
_output_shapes
: *
dtype0*
shape:
��*)
shared_namednn/hiddenlayer_3/kernel
�
9dnn/hiddenlayer_3/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_3/kernel*
_output_shapes
: 
�
dnn/hiddenlayer_3/kernel/AssignAssignVariableOpdnn/hiddenlayer_3/kernel3dnn/hiddenlayer_3/kernel/Initializer/random_uniform*
dtype0
�
,dnn/hiddenlayer_3/kernel/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/kernel* 
_output_shapes
:
��*
dtype0
�
(dnn/hiddenlayer_3/bias/Initializer/zerosConst*)
_class
loc:@dnn/hiddenlayer_3/bias*
_output_shapes	
:�*
dtype0*
valueB�*    
�
dnn/hiddenlayer_3/biasVarHandleOp*)
_class
loc:@dnn/hiddenlayer_3/bias*
_output_shapes
: *
dtype0*
shape:�*'
shared_namednn/hiddenlayer_3/bias
}
7dnn/hiddenlayer_3/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_3/bias*
_output_shapes
: 
�
dnn/hiddenlayer_3/bias/AssignAssignVariableOpdnn/hiddenlayer_3/bias(dnn/hiddenlayer_3/bias/Initializer/zeros*
dtype0
~
*dnn/hiddenlayer_3/bias/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/bias*
_output_shapes	
:�*
dtype0
�
'dnn/hiddenlayer_3/MatMul/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/kernel* 
_output_shapes
:
��*
dtype0
�
dnn/hiddenlayer_3/MatMulMatMuldnn/hiddenlayer_2/Relu'dnn/hiddenlayer_3/MatMul/ReadVariableOp*
T0*(
_output_shapes
:����������
|
(dnn/hiddenlayer_3/BiasAdd/ReadVariableOpReadVariableOpdnn/hiddenlayer_3/bias*
_output_shapes	
:�*
dtype0
�
dnn/hiddenlayer_3/BiasAddBiasAdddnn/hiddenlayer_3/MatMul(dnn/hiddenlayer_3/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:����������
l
dnn/hiddenlayer_3/ReluReludnn/hiddenlayer_3/BiasAdd*
T0*(
_output_shapes
:����������
i
dnn/zero_fraction_3/SizeSizednn/hiddenlayer_3/Relu*
T0*
_output_shapes
: *
out_type0	
e
dnn/zero_fraction_3/LessEqual/yConst*
_output_shapes
: *
dtype0	*
valueB	 R����
�
dnn/zero_fraction_3/LessEqual	LessEqualdnn/zero_fraction_3/Sizednn/zero_fraction_3/LessEqual/y*
T0	*
_output_shapes
: 
�
dnn/zero_fraction_3/condStatelessIfdnn/zero_fraction_3/LessEqualdnn/hiddenlayer_3/Relu*
Tcond0
*
Tin
2*
Tout

2	*
_lower_using_switch_merge(* 
_output_shapes
: : : : : : *7
else_branch(R&
$dnn_zero_fraction_3_cond_false_93459*
output_shapes
: : : : : : *6
then_branch'R%
#dnn_zero_fraction_3_cond_true_93458
h
!dnn/zero_fraction_3/cond/IdentityIdentitydnn/zero_fraction_3/cond*
T0	*
_output_shapes
: 
l
#dnn/zero_fraction_3/cond/Identity_1Identitydnn/zero_fraction_3/cond:1*
T0*
_output_shapes
: 
l
#dnn/zero_fraction_3/cond/Identity_2Identitydnn/zero_fraction_3/cond:2*
T0*
_output_shapes
: 
l
#dnn/zero_fraction_3/cond/Identity_3Identitydnn/zero_fraction_3/cond:3*
T0*
_output_shapes
: 
l
#dnn/zero_fraction_3/cond/Identity_4Identitydnn/zero_fraction_3/cond:4*
T0*
_output_shapes
: 
l
#dnn/zero_fraction_3/cond/Identity_5Identitydnn/zero_fraction_3/cond:5*
T0*
_output_shapes
: 
�
*dnn/zero_fraction_3/counts_to_fraction/subSubdnn/zero_fraction_3/Size!dnn/zero_fraction_3/cond/Identity*
T0	*
_output_shapes
: 
�
+dnn/zero_fraction_3/counts_to_fraction/CastCast*dnn/zero_fraction_3/counts_to_fraction/sub*

DstT0*

SrcT0	*
_output_shapes
: 

-dnn/zero_fraction_3/counts_to_fraction/Cast_1Castdnn/zero_fraction_3/Size*

DstT0*

SrcT0	*
_output_shapes
: 
�
.dnn/zero_fraction_3/counts_to_fraction/truedivRealDiv+dnn/zero_fraction_3/counts_to_fraction/Cast-dnn/zero_fraction_3/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
y
dnn/zero_fraction_3/fractionIdentity.dnn/zero_fraction_3/counts_to_fraction/truediv*
T0*
_output_shapes
: 
�
.dnn/hiddenlayer_3/fraction_of_zero_values/tagsConst*
_output_shapes
: *
dtype0*:
value1B/ B)dnn/hiddenlayer_3/fraction_of_zero_values
�
)dnn/hiddenlayer_3/fraction_of_zero_valuesScalarSummary.dnn/hiddenlayer_3/fraction_of_zero_values/tagsdnn/zero_fraction_3/fraction*
T0*
_output_shapes
: 
}
 dnn/hiddenlayer_3/activation/tagConst*
_output_shapes
: *
dtype0*-
value$B" Bdnn/hiddenlayer_3/activation
�
dnn/hiddenlayer_3/activationHistogramSummary dnn/hiddenlayer_3/activation/tagdnn/hiddenlayer_3/Relu*
_output_shapes
: 
�
2dnn/logits/kernel/Initializer/random_uniform/shapeConst*$
_class
loc:@dnn/logits/kernel*
_output_shapes
:*
dtype0*
valueB"�      
�
0dnn/logits/kernel/Initializer/random_uniform/minConst*$
_class
loc:@dnn/logits/kernel*
_output_shapes
: *
dtype0*
valueB
 *n�\�
�
0dnn/logits/kernel/Initializer/random_uniform/maxConst*$
_class
loc:@dnn/logits/kernel*
_output_shapes
: *
dtype0*
valueB
 *n�\>
�
:dnn/logits/kernel/Initializer/random_uniform/RandomUniformRandomUniform2dnn/logits/kernel/Initializer/random_uniform/shape*
T0*$
_class
loc:@dnn/logits/kernel*
_output_shapes
:	�*
dtype0
�
0dnn/logits/kernel/Initializer/random_uniform/subSub0dnn/logits/kernel/Initializer/random_uniform/max0dnn/logits/kernel/Initializer/random_uniform/min*
T0*$
_class
loc:@dnn/logits/kernel*
_output_shapes
: 
�
0dnn/logits/kernel/Initializer/random_uniform/mulMul:dnn/logits/kernel/Initializer/random_uniform/RandomUniform0dnn/logits/kernel/Initializer/random_uniform/sub*
T0*$
_class
loc:@dnn/logits/kernel*
_output_shapes
:	�
�
,dnn/logits/kernel/Initializer/random_uniformAdd0dnn/logits/kernel/Initializer/random_uniform/mul0dnn/logits/kernel/Initializer/random_uniform/min*
T0*$
_class
loc:@dnn/logits/kernel*
_output_shapes
:	�
�
dnn/logits/kernelVarHandleOp*$
_class
loc:@dnn/logits/kernel*
_output_shapes
: *
dtype0*
shape:	�*"
shared_namednn/logits/kernel
s
2dnn/logits/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/logits/kernel*
_output_shapes
: 
z
dnn/logits/kernel/AssignAssignVariableOpdnn/logits/kernel,dnn/logits/kernel/Initializer/random_uniform*
dtype0
x
%dnn/logits/kernel/Read/ReadVariableOpReadVariableOpdnn/logits/kernel*
_output_shapes
:	�*
dtype0
�
!dnn/logits/bias/Initializer/zerosConst*"
_class
loc:@dnn/logits/bias*
_output_shapes
:*
dtype0*
valueB*    
�
dnn/logits/biasVarHandleOp*"
_class
loc:@dnn/logits/bias*
_output_shapes
: *
dtype0*
shape:* 
shared_namednn/logits/bias
o
0dnn/logits/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/logits/bias*
_output_shapes
: 
k
dnn/logits/bias/AssignAssignVariableOpdnn/logits/bias!dnn/logits/bias/Initializer/zeros*
dtype0
o
#dnn/logits/bias/Read/ReadVariableOpReadVariableOpdnn/logits/bias*
_output_shapes
:*
dtype0
s
 dnn/logits/MatMul/ReadVariableOpReadVariableOpdnn/logits/kernel*
_output_shapes
:	�*
dtype0
�
dnn/logits/MatMulMatMuldnn/hiddenlayer_3/Relu dnn/logits/MatMul/ReadVariableOp*
T0*'
_output_shapes
:���������
m
!dnn/logits/BiasAdd/ReadVariableOpReadVariableOpdnn/logits/bias*
_output_shapes
:*
dtype0
�
dnn/logits/BiasAddBiasAdddnn/logits/MatMul!dnn/logits/BiasAdd/ReadVariableOp*
T0*'
_output_shapes
:���������
e
dnn/zero_fraction_4/SizeSizednn/logits/BiasAdd*
T0*
_output_shapes
: *
out_type0	
e
dnn/zero_fraction_4/LessEqual/yConst*
_output_shapes
: *
dtype0	*
valueB	 R����
�
dnn/zero_fraction_4/LessEqual	LessEqualdnn/zero_fraction_4/Sizednn/zero_fraction_4/LessEqual/y*
T0	*
_output_shapes
: 
�
dnn/zero_fraction_4/condStatelessIfdnn/zero_fraction_4/LessEqualdnn/logits/BiasAdd*
Tcond0
*
Tin
2*
Tout

2	*
_lower_using_switch_merge(* 
_output_shapes
: : : : : : *7
else_branch(R&
$dnn_zero_fraction_4_cond_false_93528*
output_shapes
: : : : : : *6
then_branch'R%
#dnn_zero_fraction_4_cond_true_93527
h
!dnn/zero_fraction_4/cond/IdentityIdentitydnn/zero_fraction_4/cond*
T0	*
_output_shapes
: 
l
#dnn/zero_fraction_4/cond/Identity_1Identitydnn/zero_fraction_4/cond:1*
T0*
_output_shapes
: 
l
#dnn/zero_fraction_4/cond/Identity_2Identitydnn/zero_fraction_4/cond:2*
T0*
_output_shapes
: 
l
#dnn/zero_fraction_4/cond/Identity_3Identitydnn/zero_fraction_4/cond:3*
T0*
_output_shapes
: 
l
#dnn/zero_fraction_4/cond/Identity_4Identitydnn/zero_fraction_4/cond:4*
T0*
_output_shapes
: 
l
#dnn/zero_fraction_4/cond/Identity_5Identitydnn/zero_fraction_4/cond:5*
T0*
_output_shapes
: 
�
*dnn/zero_fraction_4/counts_to_fraction/subSubdnn/zero_fraction_4/Size!dnn/zero_fraction_4/cond/Identity*
T0	*
_output_shapes
: 
�
+dnn/zero_fraction_4/counts_to_fraction/CastCast*dnn/zero_fraction_4/counts_to_fraction/sub*

DstT0*

SrcT0	*
_output_shapes
: 

-dnn/zero_fraction_4/counts_to_fraction/Cast_1Castdnn/zero_fraction_4/Size*

DstT0*

SrcT0	*
_output_shapes
: 
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
'dnn/logits/fraction_of_zero_values/tagsConst*
_output_shapes
: *
dtype0*3
value*B( B"dnn/logits/fraction_of_zero_values
�
"dnn/logits/fraction_of_zero_valuesScalarSummary'dnn/logits/fraction_of_zero_values/tagsdnn/zero_fraction_4/fraction*
T0*
_output_shapes
: 
o
dnn/logits/activation/tagConst*
_output_shapes
: *
dtype0*&
valueB Bdnn/logits/activation
p
dnn/logits/activationHistogramSummarydnn/logits/activation/tagdnn/logits/BiasAdd*
_output_shapes
: 
S
head/logits/ShapeShapednn/logits/BiasAdd*
T0*
_output_shapes
:
g
%head/logits/assert_rank_at_least/rankConst*
_output_shapes
: *
dtype0*
value	B :
W
Ohead/logits/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
H
@head/logits/assert_rank_at_least/static_checks_determined_all_okNoOp

initNoOp
�
init_all_tablesNoOpt^dnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/hash_table/table_init/LookupTableImportV2|^dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/hash_table/table_init/LookupTableImportV2x^dnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/hash_table/table_init/LookupTableImportV2

init_1NoOp
4

group_depsNoOp^init^init_1^init_all_tables
Y
save/filename/inputConst*
_output_shapes
: *
dtype0*
valueB Bmodel
n
save/filenamePlaceholderWithDefaultsave/filename/input*
_output_shapes
: *
dtype0*
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
_output_shapes
: *
dtype0*
shape: 
�
save/StringJoin/inputs_1Const*
_output_shapes
: *
dtype0*<
value3B1 B+_temp_a2f5ce93d8e94934a4e9d917af3d1f4a/part
d
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: 
Q
save/num_shardsConst*
_output_shapes
: *
dtype0*
value	B :
k
save/ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 
�
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
�
save/SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*�
value�B�Bdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/hiddenlayer_3/biasBdnn/hiddenlayer_3/kernelBLdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weightsBPdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weightsBNdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weightsBdnn/logits/biasBdnn/logits/kernelBglobal_step
�
save/SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*/
value&B$B B B B B B B B B B B B B B 
�
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slices*dnn/hiddenlayer_0/bias/Read/ReadVariableOp,dnn/hiddenlayer_0/kernel/Read/ReadVariableOp*dnn/hiddenlayer_1/bias/Read/ReadVariableOp,dnn/hiddenlayer_1/kernel/Read/ReadVariableOp*dnn/hiddenlayer_2/bias/Read/ReadVariableOp,dnn/hiddenlayer_2/kernel/Read/ReadVariableOp*dnn/hiddenlayer_3/bias/Read/ReadVariableOp,dnn/hiddenlayer_3/kernel/Read/ReadVariableOp`dnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Read/ReadVariableOpddnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Read/ReadVariableOpbdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Read/ReadVariableOp#dnn/logits/bias/Read/ReadVariableOp%dnn/logits/kernel/Read/ReadVariableOpglobal_step/Read/ReadVariableOp"/device:CPU:0*
dtypes
2	
�
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
�
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
N*
T0*
_output_shapes
:
u
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0
�
save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 
�
save/RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*�
value�B�Bdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/hiddenlayer_3/biasBdnn/hiddenlayer_3/kernelBLdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weightsBPdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weightsBNdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weightsBdnn/logits/biasBdnn/logits/kernelBglobal_step
�
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*/
value&B$B B B B B B B B B B B B B B 
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*L
_output_shapes:
8::::::::::::::*
dtypes
2	
N
save/Identity_1Identitysave/RestoreV2*
T0*
_output_shapes
:
_
save/AssignVariableOpAssignVariableOpdnn/hiddenlayer_0/biassave/Identity_1*
dtype0
P
save/Identity_2Identitysave/RestoreV2:1*
T0*
_output_shapes
:
c
save/AssignVariableOp_1AssignVariableOpdnn/hiddenlayer_0/kernelsave/Identity_2*
dtype0
P
save/Identity_3Identitysave/RestoreV2:2*
T0*
_output_shapes
:
a
save/AssignVariableOp_2AssignVariableOpdnn/hiddenlayer_1/biassave/Identity_3*
dtype0
P
save/Identity_4Identitysave/RestoreV2:3*
T0*
_output_shapes
:
c
save/AssignVariableOp_3AssignVariableOpdnn/hiddenlayer_1/kernelsave/Identity_4*
dtype0
P
save/Identity_5Identitysave/RestoreV2:4*
T0*
_output_shapes
:
a
save/AssignVariableOp_4AssignVariableOpdnn/hiddenlayer_2/biassave/Identity_5*
dtype0
P
save/Identity_6Identitysave/RestoreV2:5*
T0*
_output_shapes
:
c
save/AssignVariableOp_5AssignVariableOpdnn/hiddenlayer_2/kernelsave/Identity_6*
dtype0
P
save/Identity_7Identitysave/RestoreV2:6*
T0*
_output_shapes
:
a
save/AssignVariableOp_6AssignVariableOpdnn/hiddenlayer_3/biassave/Identity_7*
dtype0
P
save/Identity_8Identitysave/RestoreV2:7*
T0*
_output_shapes
:
c
save/AssignVariableOp_7AssignVariableOpdnn/hiddenlayer_3/kernelsave/Identity_8*
dtype0
P
save/Identity_9Identitysave/RestoreV2:8*
T0*
_output_shapes
:
�
save/AssignVariableOp_8AssignVariableOpLdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weightssave/Identity_9*
dtype0
Q
save/Identity_10Identitysave/RestoreV2:9*
T0*
_output_shapes
:
�
save/AssignVariableOp_9AssignVariableOpPdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weightssave/Identity_10*
dtype0
R
save/Identity_11Identitysave/RestoreV2:10*
T0*
_output_shapes
:
�
save/AssignVariableOp_10AssignVariableOpNdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weightssave/Identity_11*
dtype0
R
save/Identity_12Identitysave/RestoreV2:11*
T0*
_output_shapes
:
\
save/AssignVariableOp_11AssignVariableOpdnn/logits/biassave/Identity_12*
dtype0
R
save/Identity_13Identitysave/RestoreV2:12*
T0*
_output_shapes
:
^
save/AssignVariableOp_12AssignVariableOpdnn/logits/kernelsave/Identity_13*
dtype0
R
save/Identity_14Identitysave/RestoreV2:13*
T0	*
_output_shapes
:
X
save/AssignVariableOp_13AssignVariableOpglobal_stepsave/Identity_14*
dtype0	
�
save/restore_shardNoOp^save/AssignVariableOp^save/AssignVariableOp_1^save/AssignVariableOp_10^save/AssignVariableOp_11^save/AssignVariableOp_12^save/AssignVariableOp_13^save/AssignVariableOp_2^save/AssignVariableOp_3^save/AssignVariableOp_4^save/AssignVariableOp_5^save/AssignVariableOp_6^save/AssignVariableOp_7^save/AssignVariableOp_8^save/AssignVariableOp_9
-
save/restore_allNoOp^save/restore_shard��
�
�
!dnn_zero_fraction_cond_true_932481
-count_nonzero_notequal_dnn_hiddenlayer_0_relu
cast	
optionalfromvalue
optionalfromvalue_1
optionalfromvalue_2
optionalfromvalue_3
optionalfromvalue_4o
count_nonzero/zerosConst*
_output_shapes
: *
dtype0*
valueB
 *    2
count_nonzero/zeros�
count_nonzero/NotEqualNotEqual-count_nonzero_notequal_dnn_hiddenlayer_0_relucount_nonzero/zeros:output:0*
T0*(
_output_shapes
:����������2
count_nonzero/NotEqual�
count_nonzero/CastCastcount_nonzero/NotEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������2
count_nonzero/Cast{
count_nonzero/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2
count_nonzero/Const�
count_nonzero/nonzero_countSumcount_nonzero/Cast:y:0count_nonzero/Const:output:0*
T0*
_output_shapes
: 2
count_nonzero/nonzero_countj
CastCast$count_nonzero/nonzero_count:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2
Cast�
OptionalFromValueOptionalFromValuecount_nonzero/zeros:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue�
OptionalFromValue_1OptionalFromValuecount_nonzero/NotEqual:z:0*
Toutput_types
2
*
_output_shapes
: 2
OptionalFromValue_1�
OptionalFromValue_2OptionalFromValuecount_nonzero/Cast:y:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_2�
OptionalFromValue_3OptionalFromValuecount_nonzero/Const:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_3�
OptionalFromValue_4OptionalFromValue$count_nonzero/nonzero_count:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_4"
castCast:y:0"1
optionalfromvalueOptionalFromValue:optional:0"5
optionalfromvalue_1OptionalFromValue_1:optional:0"5
optionalfromvalue_2OptionalFromValue_2:optional:0"5
optionalfromvalue_3OptionalFromValue_3:optional:0"5
optionalfromvalue_4OptionalFromValue_4:optional:0*'
_input_shapes
:����������
�
�
$dnn_zero_fraction_3_cond_false_934591
-count_nonzero_notequal_dnn_hiddenlayer_3_relu
count_nonzero_nonzero_count	
optionalfromvalue
optionalfromvalue_1
optionalfromvalue_2
optionalfromvalue_3
optionalnoneo
count_nonzero/zerosConst*
_output_shapes
: *
dtype0*
valueB
 *    2
count_nonzero/zeros�
count_nonzero/NotEqualNotEqual-count_nonzero_notequal_dnn_hiddenlayer_3_relucount_nonzero/zeros:output:0*
T0*(
_output_shapes
:����������2
count_nonzero/NotEqual�
count_nonzero/CastCastcount_nonzero/NotEqual:z:0*

DstT0	*

SrcT0
*(
_output_shapes
:����������2
count_nonzero/Cast{
count_nonzero/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2
count_nonzero/Const�
count_nonzero/nonzero_countSumcount_nonzero/Cast:y:0count_nonzero/Const:output:0*
T0	*
_output_shapes
: 2
count_nonzero/nonzero_count�
OptionalFromValueOptionalFromValuecount_nonzero/zeros:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue�
OptionalFromValue_1OptionalFromValuecount_nonzero/NotEqual:z:0*
Toutput_types
2
*
_output_shapes
: 2
OptionalFromValue_1�
OptionalFromValue_2OptionalFromValuecount_nonzero/Cast:y:0*
Toutput_types
2	*
_output_shapes
: 2
OptionalFromValue_2�
OptionalFromValue_3OptionalFromValuecount_nonzero/Const:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_3D
OptionalNoneOptionalNone*
_output_shapes
: 2
OptionalNone"C
count_nonzero_nonzero_count$count_nonzero/nonzero_count:output:0"1
optionalfromvalueOptionalFromValue:optional:0"5
optionalfromvalue_1OptionalFromValue_1:optional:0"5
optionalfromvalue_2OptionalFromValue_2:optional:0"5
optionalfromvalue_3OptionalFromValue_3:optional:0"'
optionalnoneOptionalNone:optional:0*'
_input_shapes
:����������
�
�
#dnn_zero_fraction_4_cond_true_93527-
)count_nonzero_notequal_dnn_logits_biasadd
cast	
optionalfromvalue
optionalfromvalue_1
optionalfromvalue_2
optionalfromvalue_3
optionalfromvalue_4o
count_nonzero/zerosConst*
_output_shapes
: *
dtype0*
valueB
 *    2
count_nonzero/zeros�
count_nonzero/NotEqualNotEqual)count_nonzero_notequal_dnn_logits_biasaddcount_nonzero/zeros:output:0*
T0*'
_output_shapes
:���������2
count_nonzero/NotEqual�
count_nonzero/CastCastcount_nonzero/NotEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:���������2
count_nonzero/Cast{
count_nonzero/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2
count_nonzero/Const�
count_nonzero/nonzero_countSumcount_nonzero/Cast:y:0count_nonzero/Const:output:0*
T0*
_output_shapes
: 2
count_nonzero/nonzero_countj
CastCast$count_nonzero/nonzero_count:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2
Cast�
OptionalFromValueOptionalFromValuecount_nonzero/zeros:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue�
OptionalFromValue_1OptionalFromValuecount_nonzero/NotEqual:z:0*
Toutput_types
2
*
_output_shapes
: 2
OptionalFromValue_1�
OptionalFromValue_2OptionalFromValuecount_nonzero/Cast:y:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_2�
OptionalFromValue_3OptionalFromValuecount_nonzero/Const:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_3�
OptionalFromValue_4OptionalFromValue$count_nonzero/nonzero_count:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_4"
castCast:y:0"1
optionalfromvalueOptionalFromValue:optional:0"5
optionalfromvalue_1OptionalFromValue_1:optional:0"5
optionalfromvalue_2OptionalFromValue_2:optional:0"5
optionalfromvalue_3OptionalFromValue_3:optional:0"5
optionalfromvalue_4OptionalFromValue_4:optional:0*&
_input_shapes
:���������
�
�
#dnn_zero_fraction_3_cond_true_934581
-count_nonzero_notequal_dnn_hiddenlayer_3_relu
cast	
optionalfromvalue
optionalfromvalue_1
optionalfromvalue_2
optionalfromvalue_3
optionalfromvalue_4o
count_nonzero/zerosConst*
_output_shapes
: *
dtype0*
valueB
 *    2
count_nonzero/zeros�
count_nonzero/NotEqualNotEqual-count_nonzero_notequal_dnn_hiddenlayer_3_relucount_nonzero/zeros:output:0*
T0*(
_output_shapes
:����������2
count_nonzero/NotEqual�
count_nonzero/CastCastcount_nonzero/NotEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������2
count_nonzero/Cast{
count_nonzero/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2
count_nonzero/Const�
count_nonzero/nonzero_countSumcount_nonzero/Cast:y:0count_nonzero/Const:output:0*
T0*
_output_shapes
: 2
count_nonzero/nonzero_countj
CastCast$count_nonzero/nonzero_count:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2
Cast�
OptionalFromValueOptionalFromValuecount_nonzero/zeros:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue�
OptionalFromValue_1OptionalFromValuecount_nonzero/NotEqual:z:0*
Toutput_types
2
*
_output_shapes
: 2
OptionalFromValue_1�
OptionalFromValue_2OptionalFromValuecount_nonzero/Cast:y:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_2�
OptionalFromValue_3OptionalFromValuecount_nonzero/Const:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_3�
OptionalFromValue_4OptionalFromValue$count_nonzero/nonzero_count:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_4"
castCast:y:0"1
optionalfromvalueOptionalFromValue:optional:0"5
optionalfromvalue_1OptionalFromValue_1:optional:0"5
optionalfromvalue_2OptionalFromValue_2:optional:0"5
optionalfromvalue_3OptionalFromValue_3:optional:0"5
optionalfromvalue_4OptionalFromValue_4:optional:0*'
_input_shapes
:����������
�
�
$dnn_zero_fraction_2_cond_false_933891
-count_nonzero_notequal_dnn_hiddenlayer_2_relu
count_nonzero_nonzero_count	
optionalfromvalue
optionalfromvalue_1
optionalfromvalue_2
optionalfromvalue_3
optionalnoneo
count_nonzero/zerosConst*
_output_shapes
: *
dtype0*
valueB
 *    2
count_nonzero/zeros�
count_nonzero/NotEqualNotEqual-count_nonzero_notequal_dnn_hiddenlayer_2_relucount_nonzero/zeros:output:0*
T0*(
_output_shapes
:����������2
count_nonzero/NotEqual�
count_nonzero/CastCastcount_nonzero/NotEqual:z:0*

DstT0	*

SrcT0
*(
_output_shapes
:����������2
count_nonzero/Cast{
count_nonzero/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2
count_nonzero/Const�
count_nonzero/nonzero_countSumcount_nonzero/Cast:y:0count_nonzero/Const:output:0*
T0	*
_output_shapes
: 2
count_nonzero/nonzero_count�
OptionalFromValueOptionalFromValuecount_nonzero/zeros:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue�
OptionalFromValue_1OptionalFromValuecount_nonzero/NotEqual:z:0*
Toutput_types
2
*
_output_shapes
: 2
OptionalFromValue_1�
OptionalFromValue_2OptionalFromValuecount_nonzero/Cast:y:0*
Toutput_types
2	*
_output_shapes
: 2
OptionalFromValue_2�
OptionalFromValue_3OptionalFromValuecount_nonzero/Const:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_3D
OptionalNoneOptionalNone*
_output_shapes
: 2
OptionalNone"C
count_nonzero_nonzero_count$count_nonzero/nonzero_count:output:0"1
optionalfromvalueOptionalFromValue:optional:0"5
optionalfromvalue_1OptionalFromValue_1:optional:0"5
optionalfromvalue_2OptionalFromValue_2:optional:0"5
optionalfromvalue_3OptionalFromValue_3:optional:0"'
optionalnoneOptionalNone:optional:0*'
_input_shapes
:����������
�
�
$dnn_zero_fraction_1_cond_false_933191
-count_nonzero_notequal_dnn_hiddenlayer_1_relu
count_nonzero_nonzero_count	
optionalfromvalue
optionalfromvalue_1
optionalfromvalue_2
optionalfromvalue_3
optionalnoneo
count_nonzero/zerosConst*
_output_shapes
: *
dtype0*
valueB
 *    2
count_nonzero/zeros�
count_nonzero/NotEqualNotEqual-count_nonzero_notequal_dnn_hiddenlayer_1_relucount_nonzero/zeros:output:0*
T0*(
_output_shapes
:����������2
count_nonzero/NotEqual�
count_nonzero/CastCastcount_nonzero/NotEqual:z:0*

DstT0	*

SrcT0
*(
_output_shapes
:����������2
count_nonzero/Cast{
count_nonzero/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2
count_nonzero/Const�
count_nonzero/nonzero_countSumcount_nonzero/Cast:y:0count_nonzero/Const:output:0*
T0	*
_output_shapes
: 2
count_nonzero/nonzero_count�
OptionalFromValueOptionalFromValuecount_nonzero/zeros:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue�
OptionalFromValue_1OptionalFromValuecount_nonzero/NotEqual:z:0*
Toutput_types
2
*
_output_shapes
: 2
OptionalFromValue_1�
OptionalFromValue_2OptionalFromValuecount_nonzero/Cast:y:0*
Toutput_types
2	*
_output_shapes
: 2
OptionalFromValue_2�
OptionalFromValue_3OptionalFromValuecount_nonzero/Const:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_3D
OptionalNoneOptionalNone*
_output_shapes
: 2
OptionalNone"C
count_nonzero_nonzero_count$count_nonzero/nonzero_count:output:0"1
optionalfromvalueOptionalFromValue:optional:0"5
optionalfromvalue_1OptionalFromValue_1:optional:0"5
optionalfromvalue_2OptionalFromValue_2:optional:0"5
optionalfromvalue_3OptionalFromValue_3:optional:0"'
optionalnoneOptionalNone:optional:0*'
_input_shapes
:����������
�
�
$dnn_zero_fraction_4_cond_false_93528-
)count_nonzero_notequal_dnn_logits_biasadd
count_nonzero_nonzero_count	
optionalfromvalue
optionalfromvalue_1
optionalfromvalue_2
optionalfromvalue_3
optionalnoneo
count_nonzero/zerosConst*
_output_shapes
: *
dtype0*
valueB
 *    2
count_nonzero/zeros�
count_nonzero/NotEqualNotEqual)count_nonzero_notequal_dnn_logits_biasaddcount_nonzero/zeros:output:0*
T0*'
_output_shapes
:���������2
count_nonzero/NotEqual�
count_nonzero/CastCastcount_nonzero/NotEqual:z:0*

DstT0	*

SrcT0
*'
_output_shapes
:���������2
count_nonzero/Cast{
count_nonzero/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2
count_nonzero/Const�
count_nonzero/nonzero_countSumcount_nonzero/Cast:y:0count_nonzero/Const:output:0*
T0	*
_output_shapes
: 2
count_nonzero/nonzero_count�
OptionalFromValueOptionalFromValuecount_nonzero/zeros:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue�
OptionalFromValue_1OptionalFromValuecount_nonzero/NotEqual:z:0*
Toutput_types
2
*
_output_shapes
: 2
OptionalFromValue_1�
OptionalFromValue_2OptionalFromValuecount_nonzero/Cast:y:0*
Toutput_types
2	*
_output_shapes
: 2
OptionalFromValue_2�
OptionalFromValue_3OptionalFromValuecount_nonzero/Const:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_3D
OptionalNoneOptionalNone*
_output_shapes
: 2
OptionalNone"C
count_nonzero_nonzero_count$count_nonzero/nonzero_count:output:0"1
optionalfromvalueOptionalFromValue:optional:0"5
optionalfromvalue_1OptionalFromValue_1:optional:0"5
optionalfromvalue_2OptionalFromValue_2:optional:0"5
optionalfromvalue_3OptionalFromValue_3:optional:0"'
optionalnoneOptionalNone:optional:0*&
_input_shapes
:���������
�
�
#dnn_zero_fraction_2_cond_true_933881
-count_nonzero_notequal_dnn_hiddenlayer_2_relu
cast	
optionalfromvalue
optionalfromvalue_1
optionalfromvalue_2
optionalfromvalue_3
optionalfromvalue_4o
count_nonzero/zerosConst*
_output_shapes
: *
dtype0*
valueB
 *    2
count_nonzero/zeros�
count_nonzero/NotEqualNotEqual-count_nonzero_notequal_dnn_hiddenlayer_2_relucount_nonzero/zeros:output:0*
T0*(
_output_shapes
:����������2
count_nonzero/NotEqual�
count_nonzero/CastCastcount_nonzero/NotEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������2
count_nonzero/Cast{
count_nonzero/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2
count_nonzero/Const�
count_nonzero/nonzero_countSumcount_nonzero/Cast:y:0count_nonzero/Const:output:0*
T0*
_output_shapes
: 2
count_nonzero/nonzero_countj
CastCast$count_nonzero/nonzero_count:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2
Cast�
OptionalFromValueOptionalFromValuecount_nonzero/zeros:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue�
OptionalFromValue_1OptionalFromValuecount_nonzero/NotEqual:z:0*
Toutput_types
2
*
_output_shapes
: 2
OptionalFromValue_1�
OptionalFromValue_2OptionalFromValuecount_nonzero/Cast:y:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_2�
OptionalFromValue_3OptionalFromValuecount_nonzero/Const:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_3�
OptionalFromValue_4OptionalFromValue$count_nonzero/nonzero_count:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_4"
castCast:y:0"1
optionalfromvalueOptionalFromValue:optional:0"5
optionalfromvalue_1OptionalFromValue_1:optional:0"5
optionalfromvalue_2OptionalFromValue_2:optional:0"5
optionalfromvalue_3OptionalFromValue_3:optional:0"5
optionalfromvalue_4OptionalFromValue_4:optional:0*'
_input_shapes
:����������
�
�
"dnn_zero_fraction_cond_false_932491
-count_nonzero_notequal_dnn_hiddenlayer_0_relu
count_nonzero_nonzero_count	
optionalfromvalue
optionalfromvalue_1
optionalfromvalue_2
optionalfromvalue_3
optionalnoneo
count_nonzero/zerosConst*
_output_shapes
: *
dtype0*
valueB
 *    2
count_nonzero/zeros�
count_nonzero/NotEqualNotEqual-count_nonzero_notequal_dnn_hiddenlayer_0_relucount_nonzero/zeros:output:0*
T0*(
_output_shapes
:����������2
count_nonzero/NotEqual�
count_nonzero/CastCastcount_nonzero/NotEqual:z:0*

DstT0	*

SrcT0
*(
_output_shapes
:����������2
count_nonzero/Cast{
count_nonzero/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2
count_nonzero/Const�
count_nonzero/nonzero_countSumcount_nonzero/Cast:y:0count_nonzero/Const:output:0*
T0	*
_output_shapes
: 2
count_nonzero/nonzero_count�
OptionalFromValueOptionalFromValuecount_nonzero/zeros:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue�
OptionalFromValue_1OptionalFromValuecount_nonzero/NotEqual:z:0*
Toutput_types
2
*
_output_shapes
: 2
OptionalFromValue_1�
OptionalFromValue_2OptionalFromValuecount_nonzero/Cast:y:0*
Toutput_types
2	*
_output_shapes
: 2
OptionalFromValue_2�
OptionalFromValue_3OptionalFromValuecount_nonzero/Const:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_3D
OptionalNoneOptionalNone*
_output_shapes
: 2
OptionalNone"C
count_nonzero_nonzero_count$count_nonzero/nonzero_count:output:0"1
optionalfromvalueOptionalFromValue:optional:0"5
optionalfromvalue_1OptionalFromValue_1:optional:0"5
optionalfromvalue_2OptionalFromValue_2:optional:0"5
optionalfromvalue_3OptionalFromValue_3:optional:0"'
optionalnoneOptionalNone:optional:0*'
_input_shapes
:����������
�
�
#dnn_zero_fraction_1_cond_true_933181
-count_nonzero_notequal_dnn_hiddenlayer_1_relu
cast	
optionalfromvalue
optionalfromvalue_1
optionalfromvalue_2
optionalfromvalue_3
optionalfromvalue_4o
count_nonzero/zerosConst*
_output_shapes
: *
dtype0*
valueB
 *    2
count_nonzero/zeros�
count_nonzero/NotEqualNotEqual-count_nonzero_notequal_dnn_hiddenlayer_1_relucount_nonzero/zeros:output:0*
T0*(
_output_shapes
:����������2
count_nonzero/NotEqual�
count_nonzero/CastCastcount_nonzero/NotEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������2
count_nonzero/Cast{
count_nonzero/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2
count_nonzero/Const�
count_nonzero/nonzero_countSumcount_nonzero/Cast:y:0count_nonzero/Const:output:0*
T0*
_output_shapes
: 2
count_nonzero/nonzero_countj
CastCast$count_nonzero/nonzero_count:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2
Cast�
OptionalFromValueOptionalFromValuecount_nonzero/zeros:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue�
OptionalFromValue_1OptionalFromValuecount_nonzero/NotEqual:z:0*
Toutput_types
2
*
_output_shapes
: 2
OptionalFromValue_1�
OptionalFromValue_2OptionalFromValuecount_nonzero/Cast:y:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_2�
OptionalFromValue_3OptionalFromValuecount_nonzero/Const:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_3�
OptionalFromValue_4OptionalFromValue$count_nonzero/nonzero_count:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_4"
castCast:y:0"1
optionalfromvalueOptionalFromValue:optional:0"5
optionalfromvalue_1OptionalFromValue_1:optional:0"5
optionalfromvalue_2OptionalFromValue_2:optional:0"5
optionalfromvalue_3OptionalFromValue_3:optional:0"5
optionalfromvalue_4OptionalFromValue_4:optional:0*'
_input_shapes
:����������"�<
save/Const:0save/Identity:0save/restore_all (5 @F8"~
global_stepom
k
global_step:0global_step/Assign!global_step/Read/ReadVariableOp:0(2global_step/Initializer/zeros:0H"%
saved_model_main_op


group_deps"�
	summaries�
�
+dnn/hiddenlayer_0/fraction_of_zero_values:0
dnn/hiddenlayer_0/activation:0
+dnn/hiddenlayer_1/fraction_of_zero_values:0
dnn/hiddenlayer_1/activation:0
+dnn/hiddenlayer_2/fraction_of_zero_values:0
dnn/hiddenlayer_2/activation:0
+dnn/hiddenlayer_3/fraction_of_zero_values:0
dnn/hiddenlayer_3/activation:0
$dnn/logits/fraction_of_zero_values:0
dnn/logits/activation:0"�
table_initializer�
�
sdnn/input_from_feature_columns/input_layer/meals_embedding_1/meals_lookup/hash_table/table_init/LookupTableImportV2
{dnn/input_from_feature_columns/input_layer/recipe_id_embedding_1/recipe_id_lookup/hash_table/table_init/LookupTableImportV2
wdnn/input_from_feature_columns/input_layer/user_id_embedding_1/user_id_lookup/hash_table/table_init/LookupTableImportV2"�
trainable_variables��
�
Ndnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights:0Sdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Assignbdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Read/ReadVariableOp:0(2kdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Initializer/truncated_normal:08
�
Rdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights:0Wdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Assignfdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Read/ReadVariableOp:0(2odnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Initializer/truncated_normal:08
�
Pdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights:0Udnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Assignddnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Read/ReadVariableOp:0(2mdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Initializer/truncated_normal:08
�
dnn/hiddenlayer_0/kernel:0dnn/hiddenlayer_0/kernel/Assign.dnn/hiddenlayer_0/kernel/Read/ReadVariableOp:0(25dnn/hiddenlayer_0/kernel/Initializer/random_uniform:08
�
dnn/hiddenlayer_0/bias:0dnn/hiddenlayer_0/bias/Assign,dnn/hiddenlayer_0/bias/Read/ReadVariableOp:0(2*dnn/hiddenlayer_0/bias/Initializer/zeros:08
�
dnn/hiddenlayer_1/kernel:0dnn/hiddenlayer_1/kernel/Assign.dnn/hiddenlayer_1/kernel/Read/ReadVariableOp:0(25dnn/hiddenlayer_1/kernel/Initializer/random_uniform:08
�
dnn/hiddenlayer_1/bias:0dnn/hiddenlayer_1/bias/Assign,dnn/hiddenlayer_1/bias/Read/ReadVariableOp:0(2*dnn/hiddenlayer_1/bias/Initializer/zeros:08
�
dnn/hiddenlayer_2/kernel:0dnn/hiddenlayer_2/kernel/Assign.dnn/hiddenlayer_2/kernel/Read/ReadVariableOp:0(25dnn/hiddenlayer_2/kernel/Initializer/random_uniform:08
�
dnn/hiddenlayer_2/bias:0dnn/hiddenlayer_2/bias/Assign,dnn/hiddenlayer_2/bias/Read/ReadVariableOp:0(2*dnn/hiddenlayer_2/bias/Initializer/zeros:08
�
dnn/hiddenlayer_3/kernel:0dnn/hiddenlayer_3/kernel/Assign.dnn/hiddenlayer_3/kernel/Read/ReadVariableOp:0(25dnn/hiddenlayer_3/kernel/Initializer/random_uniform:08
�
dnn/hiddenlayer_3/bias:0dnn/hiddenlayer_3/bias/Assign,dnn/hiddenlayer_3/bias/Read/ReadVariableOp:0(2*dnn/hiddenlayer_3/bias/Initializer/zeros:08
�
dnn/logits/kernel:0dnn/logits/kernel/Assign'dnn/logits/kernel/Read/ReadVariableOp:0(2.dnn/logits/kernel/Initializer/random_uniform:08
{
dnn/logits/bias:0dnn/logits/bias/Assign%dnn/logits/bias/Read/ReadVariableOp:0(2#dnn/logits/bias/Initializer/zeros:08"�
	variables��
k
global_step:0global_step/Assign!global_step/Read/ReadVariableOp:0(2global_step/Initializer/zeros:0H
�
Ndnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights:0Sdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Assignbdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Read/ReadVariableOp:0(2kdnn/input_from_feature_columns/input_layer/meals_embedding/embedding_weights/Initializer/truncated_normal:08
�
Rdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights:0Wdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Assignfdnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Read/ReadVariableOp:0(2odnn/input_from_feature_columns/input_layer/recipe_id_embedding/embedding_weights/Initializer/truncated_normal:08
�
Pdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights:0Udnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Assignddnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Read/ReadVariableOp:0(2mdnn/input_from_feature_columns/input_layer/user_id_embedding/embedding_weights/Initializer/truncated_normal:08
�
dnn/hiddenlayer_0/kernel:0dnn/hiddenlayer_0/kernel/Assign.dnn/hiddenlayer_0/kernel/Read/ReadVariableOp:0(25dnn/hiddenlayer_0/kernel/Initializer/random_uniform:08
�
dnn/hiddenlayer_0/bias:0dnn/hiddenlayer_0/bias/Assign,dnn/hiddenlayer_0/bias/Read/ReadVariableOp:0(2*dnn/hiddenlayer_0/bias/Initializer/zeros:08
�
dnn/hiddenlayer_1/kernel:0dnn/hiddenlayer_1/kernel/Assign.dnn/hiddenlayer_1/kernel/Read/ReadVariableOp:0(25dnn/hiddenlayer_1/kernel/Initializer/random_uniform:08
�
dnn/hiddenlayer_1/bias:0dnn/hiddenlayer_1/bias/Assign,dnn/hiddenlayer_1/bias/Read/ReadVariableOp:0(2*dnn/hiddenlayer_1/bias/Initializer/zeros:08
�
dnn/hiddenlayer_2/kernel:0dnn/hiddenlayer_2/kernel/Assign.dnn/hiddenlayer_2/kernel/Read/ReadVariableOp:0(25dnn/hiddenlayer_2/kernel/Initializer/random_uniform:08
�
dnn/hiddenlayer_2/bias:0dnn/hiddenlayer_2/bias/Assign,dnn/hiddenlayer_2/bias/Read/ReadVariableOp:0(2*dnn/hiddenlayer_2/bias/Initializer/zeros:08
�
dnn/hiddenlayer_3/kernel:0dnn/hiddenlayer_3/kernel/Assign.dnn/hiddenlayer_3/kernel/Read/ReadVariableOp:0(25dnn/hiddenlayer_3/kernel/Initializer/random_uniform:08
�
dnn/hiddenlayer_3/bias:0dnn/hiddenlayer_3/bias/Assign,dnn/hiddenlayer_3/bias/Read/ReadVariableOp:0(2*dnn/hiddenlayer_3/bias/Initializer/zeros:08
�
dnn/logits/kernel:0dnn/logits/kernel/Assign'dnn/logits/kernel/Read/ReadVariableOp:0(2.dnn/logits/kernel/Initializer/random_uniform:08
{
dnn/logits/bias:0dnn/logits/bias/Assign%dnn/logits/bias/Read/ReadVariableOp:0(2#dnn/logits/bias/Initializer/zeros:08*�
predict�
5
examples)
input_example_tensor:0���������:
predictions+
dnn/logits/BiasAdd:0���������tensorflow/serving/predict*�

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
dnn/logits/BiasAdd:0���������tensorflow/serving/regress