<?xml version="1.0"?><doc>
<members>
<member name="T:FieaGameEngine.DatumTypes" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="13">
<summary>
Enum class of the types that can be stored in the Datum
</summary>
</member>
<member name="T:FieaGameEngine.Datum" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="33">
<summary>
Datum is a Vector that determines its type at runtime.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.#ctor" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="42">
<summary>
Constructor for a Datum.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(FieaGameEngine.DatumTypes,System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="46">
<summary>
Constructor for a datum that takes in a type and an optional capacity (defaults to 10).
</summary>
<param name="type">Type for the Datum.</param>
<param name="capacity">Capacity of Datum.</param>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(FieaGameEngine.Datum!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="53">
<summary>
Assigns an already instantiated Datum to another instantiated Datum.
</summary>
<param name="otherDatum">The Datum we are assigning to this one.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(System.Int32!System.Runtime.CompilerServices.IsConst)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="60">
<summary>
Scalar assignment for an int to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The integer value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(System.Single!System.Runtime.CompilerServices.IsConst)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="67">
<summary>
Scalar assignment for a float to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The float value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="74">
<summary>
Scalar assignment for a math vector to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The vector (of 4 floats) value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="81">
<summary>
Scalar assignment for a math matrix to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The matrix (of 16 floats) value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="88">
<summary>
Scalar assignment for a string to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The string value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="95">
<summary>
Scalar assignment for a Run Time Type Information pointer to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The Run Time Type Information pointer value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Dispose" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="103">
<summary>
Destructor for a Datum.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(FieaGameEngine.Datum!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="108">
<summary>
Instantiates a Datum from another one, by copy.
</summary>
<param name="value">The other Datum.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(System.Int32!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="114">
<summary>
Instantiates a Datum from a scalar int.
</summary>
<param name="value">the int value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(System.Single!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="120">
<summary>
Instantiates a Datum from a scalar float.
</summary>
<param name="value">the float value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="126">
<summary>
Instantiates a Datum from a scalar math vector.
</summary>
<param name="value">the math vector value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="132">
<summary>
Instantiates a Datum from a scalar math matrix.
</summary>
<param name="value">the math matrix value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="138">
<summary>
Instantiates a Datum from a scalar string.
</summary>
<param name="value">the string value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="144">
<summary>
Instantiates a Datum from a scalar Run Time Type Information pointer.
</summary>
<param name="value">the Run Time Type Information pointer value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(FieaGameEngine.Datum*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="151">
<summary>
Move copy for a Datum.
</summary>
<param name="otherDatum">The other Datum.</param>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(FieaGameEngine.Datum*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="157">
<summary>
Move assignment for a Datum.
</summary>
<param name="otherDatum">The other Datum.</param>
<returns>A reference to this Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Type" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="164">
<summary>
Returns the type the Datum is.
</summary>
<returns>A constant Datum Type.</returns>
</member>
<member name="M:FieaGameEngine.Datum.SetType(FieaGameEngine.DatumTypes)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="170">
<summary>
Sets the type of the Datum.
</summary>
<param name="type">the type to set the Datum to.</param>
</member>
<member name="M:FieaGameEngine.Datum.Size" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="176">
<summary>
Gets the size of the Datum.
</summary>
<returns>A unsigned integer of the size.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Capacity" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="182">
<summary>
Gets the capacity of the Datum.
</summary>
<returns>A unsigned integer of the capacity.</returns>
</member>
<member name="M:FieaGameEngine.Datum.IsEmpty" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="188">
<summary>
Returns a bool as to whether the Datum is empty or not.
</summary>
<returns>a bool as to whether the Datum is empty or now.</returns>
</member>
<member name="M:FieaGameEngine.Datum.IsExternal" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="194">
<summary>
Returns a bool as to whether the Datum is external or not.
</summary>
<returns>a bool as to whether the Datum is external or now.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Resize(System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="200">
<summary>
Resizes the Datum to the passed in size. Can shrink or grow the Datum.
</summary>
<param name="size">The unsigned int to resize to.</param>
</member>
<member name="M:FieaGameEngine.Datum.Reserve(System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="206">
<summary>
Reserves space to the passed in size, cannot shrink the Datum.
</summary>
<param name="capacity">The unsigned int to resize to.</param>
</member>
<member name="M:FieaGameEngine.Datum.ShrinkToFit" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="212">
<summary>
Shrinks the Datum to the current size.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.Clear" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="217">
<summary>
Clear all elements in the Datum.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(System.Int32*,System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="222">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an integer(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(System.Single*,System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="229">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an float(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;*,System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="236">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an math vector(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;*,System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="243">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an math matrix(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;*,System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="250">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an string(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(FieaGameEngine.RTTI**,System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="257">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an Run Time Type Information pointer(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(FieaGameEngine.Datum!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="264">
<summary>
Equivalence comparison for Datums.
</summary>
<param name="otherDatum">The Datum we are equating to.</param>
<returns>bool as to whether they are the equivelent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(System.Int32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="271">
<summary>
Equivalence comparison for an int. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The int we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(System.Single)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="278">
<summary>
Equivalence comparison for a float. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The float we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="285">
<summary>
Equivalence comparison for a math vector. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The math vector we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="292">
<summary>
Equivalence comparison for a math matrix. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The math matrix we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="299">
<summary>
Equivalence comparison for a string. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The string we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="306">
<summary>
Equivalence comparison for a Run Time Type Information pointer. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The Run Time Type Information pointer we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(FieaGameEngine.Datum!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="313">
<summary>
Non-Equivalence comparison for Datums.
</summary>
<param name="otherDatum">The Datum we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(System.Int32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="320">
<summary>
Non-Equivalence comparison for an int. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The int we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(System.Single)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="327">
<summary>
Non-Equivalence comparison for a float. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The float we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="334">
<summary>
Non-Equivalence comparison for a math vector. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The math vector we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="341">
<summary>
Non-Equivalence comparison for a math matrix. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The math matrix we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="348">
<summary>
Equivalence comparison for a string. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The string we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="355">
<summary>
Equivalence comparison for a Run Time Type Information pointer. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The Run Time Type Information pointer we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Set(System.Int32,System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="366">
<summary>
Sets the given int value to the given index of the Datum.
</summary>
<param name="value">The int value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.Set(System.Single,System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="373">
<summary>
Sets the given float value to the given index of the Datum.
</summary>
<param name="value">The float value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.Set(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;,System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="380">
<summary>
Sets the given math vector value to the given index of the Datum.
</summary>
<param name="value">The math vector value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.Set(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;,System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="387">
<summary>
Sets the given math matrix value to the given index of the Datum.
</summary>
<param name="value">The math matrix value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.Set(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;,System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="394">
<summary>
Sets the given string value to the given index of the Datum.
</summary>
<param name="value">The string value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.Set(FieaGameEngine.RTTI*,System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="401">
<summary>
Sets the given Run Time Type Information pointer value to the given index of the Datum.
</summary>
<param name="value">The Run Time Type Information pointer value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetFromString(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;,System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="424">
<summary>
Converts the given string value to the appropriate type, and sets that value to the given index's value of the Datum.
</summary>
<param name="string">The string to set.</param>
<param name="index">The index to set at.</param>
</member>
<member name="M:FieaGameEngine.Datum.ToString(System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="431">
<summary>
Converts the value at the given index (defaults to 0) to a String of appropriate type.
</summary>
<param name="index">The index whose value we are converting to a string.</param>
<returns>The converted string.</returns>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(System.Int32!System.Runtime.CompilerServices.IsConst)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="438">
<summary>
Pushes the int value to the back of the Datum.
</summary>
<param name="value">The int value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(System.Single!System.Runtime.CompilerServices.IsConst)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="444">
<summary>
Pushes the float value to the back of the Datum.
</summary>
<param name="value">The float value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="450">
<summary>
Pushes the math vector value to the back of the Datum.
</summary>
<param name="value">The math vector value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="456">
<summary>
Pushes the math matrix value to the back of the Datum.
</summary>
<param name="value">The math matrix value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="462">
<summary>
Pushes the string value to the back of the Datum.
</summary>
<param name="value">The string value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="468">
<summary>
Pushes the Run Time Type Information pointer value to the back of the Datum.
</summary>
<param name="value">The Run Time Type Information pointer value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PopBack" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="475">
<summary>
Removes the last element of the Datum.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.Remove(System.Int32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="504">
<summary>
Removes the given int value from Datum if it exists in the Datum.
</summary>
<param name="value">The int value to remove.</param>
<returns>A Boolean as to whether the int value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Remove(System.Single)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="511">
<summary>
Removes the given float value from Datum if it exists in the Datum.
</summary>
<param name="value">The float value to remove.</param>
<returns>A Boolean as to whether the float value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Remove(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="518">
<summary>
Removes the given math vector value from Datum if it exists in the Datum.
</summary>
<param name="value">The math vector value to remove.</param>
<returns>A Boolean as to whether the math vector value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Remove(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="525">
<summary>
Removes the given math matrix value from Datum if it exists in the Datum.
</summary>
<param name="value">The math matrix value to remove.</param>
<returns>A Boolean as to whether the math matrix value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Remove(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="532">
<summary>
Removes the given string value from Datum if it exists in the Datum.
</summary>
<param name="value">The string value to remove.</param>
<returns>A Boolean as to whether the string value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Remove(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="539">
<summary>
Removes the given Run Time Type Information pointer value from Datum if it exists in the Datum.
</summary>
<param name="value">The Run Time Type Information pointer value to remove.</param>
<returns>A Boolean as to whether the Run Time Type Information pointer value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.RemoveAt(System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="548">
<summary>
Removes the value at the given index (defaults to 0).
</summary>
<param name="index">The index to remove at.</param>
</member>
<member name="M:FieaGameEngine.Datum.Find(System.Int32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="554">
<summary>
Finds the given int value in the Datum. 
</summary>
<param name="value">The int value.</param>
<returns>A pair type of: boolean as to whether the int value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Find(System.Single)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="561">
<summary>
Finds the given float value in the Datum. 
</summary>
<param name="value">The float value.</param>
<returns>A pair type of: boolean as to whether the float value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Find(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="568">
<summary>
Finds the given math vector value in the Datum. 
</summary>
<param name="value">The math vector value.</param>
<returns>A pair type of: boolean as to whether the math vector value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Find(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="575">
<summary>
Finds the given math matrix value in the Datum. 
</summary>
<param name="value">The math matrix value.</param>
<returns>A pair type of: boolean as to whether the math matrix value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Find(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="582">
<summary>
Finds the given string value in the Datum. 
</summary>
<param name="value">The string value.</param>
<returns>A pair type of: boolean as to whether the string value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Find(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\datum.h" line="589">
<summary>
Finds the given Run Time Type Information pointer value in the Datum. 
</summary>
<param name="value">The Run Time Type Information pointer value.</param>
<returns>A pair type of: boolean as to whether the Run Time Type Information pointer value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="T:FieaGameEngine.Scope" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="10">
<summary>
A Container to hold Key, datum pairs. Think of this as a c++ Struct. 
</summary>
</member>
<member name="M:FieaGameEngine.Scope.#ctor(System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="26">
<summary>
Constructor for Scope that takes in an optional size to allocate to, default is 11.
</summary>
<param name="size">The size to allocate.</param>
</member>
<member name="M:FieaGameEngine.Scope.#ctor(std.initializer_list&lt;std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;&gt;)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="32">
<summary>
Initializer list for Scope, takes in a key, and calls Append on the Scope with the appropriate key
</summary>
<param name="list">list of keys.</param>
</member>
<member name="M:FieaGameEngine.Scope.Dispose" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="38">
<summary>
Destructor for Scope, destroys any heap allocated memory. 
</summary>
</member>
<member name="M:FieaGameEngine.Scope.#ctor(FieaGameEngine.Scope!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="43">
<summary>
Copy Constructor for Scope, copy's an already instantiated Scope to this one.
</summary>
<param name="other">The other pre instantated Scope.</param>
</member>
<member name="M:FieaGameEngine.Scope.op_Assign(FieaGameEngine.Scope!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="49">
<summary>
Copy Assignment for Scope, copy's an already instantiated Scope to another already instantiated Scope.
</summary>
<param name="other">The other pre instantiated Scope.</param>
<returns>A refrence to the Scope.</returns>
</member>
<member name="M:FieaGameEngine.Scope.#ctor(FieaGameEngine.Scope*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="56">
<summary>
Move Constructor for Scope, Moves an already instantiated Scope to this one.
</summary>
<param name="other">The other pre instantated Scope.</param>
</member>
<member name="M:FieaGameEngine.Scope.op_Assign(FieaGameEngine.Scope*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="62">
<summary>
Move Assignment for Scope, Moves an already instantiated Scope to another already instantiated Scope.
</summary>
<param name="other">The other pre instantated Scope.</param>
<returns>A reference to the Scope.</returns>
</member>
<member name="M:FieaGameEngine.Scope.op_Subscript(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="69">
<summary>
Operator bracket that takes in a string to find in the current Scope, wraps Append. 
</summary>
<param name="string">The key to find in the current Scope.</param>
<returns>A reference to the found (or newly created) Datum.</returns>
</member>
<member name="M:FieaGameEngine.Scope.op_Subscript(System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="76">
<summary>
Operator bracket that takes in an index to get a Datum at. Will throw out of bounds error. 
</summary>
<param name="index">The index to find the Datum in the current Scope.</param>
<returns>A reference to the found Datum.</returns>
</member>
<member name="M:FieaGameEngine.Scope.op_Subscript(System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="83">
<summary>
Const version of Operator bracket that takes in an index to get a Datum at. Will throw out of bounds error. 
</summary>
<param name="index">The index to find the Datum in the current Scope.</param>
<returns>A constant reference to the found Datum.</returns>
</member>
<member name="M:FieaGameEngine.Scope.op_Equality(FieaGameEngine.Scope!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="90">
<summary>
Equality operator for Scope, compares this scope to the passed in Scope. Returns true if they are equivalent Scopes.
</summary>
<param name="other">The Scope we are comparing to this one.</param>
<returns>A boolean as to wheter the two Scopes are equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Scope.op_Inequality(FieaGameEngine.Scope!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="97">
<summary>
Not Equal operator for scope, compares this scope to the passed in Scope. Returns true if they are not equivalent Scopes.
</summary>
<param name="other">The Scope we are comparing to this one.</param>
<returns>A boolean as to wheter the two Scopes are not equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Find(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="104">
<summary>
Finds the passed in key (string) in the current Scope.
</summary>
<param name="string">The key (string) we are trying to find in this Scope.</param>
<returns>Returns the address of the found Datum, nullptr if it wasnt found.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Find(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="111">
<summary>
Const version of Find, Finds the passed in key (string) in the current Scope.
</summary>
<param name="string">The key (string) we are trying to find in this Scope.</param>
<returns>Returns the address of the found (constant) Datum, nullptr if it wasnt found.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Search(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="118">
<summary>
Searches for the given key (string), in this Scope, and recursively up its parents.
</summary>
<param name="string">The key (string) we are trying to search for. </param>
<returns>Returns the address of the found Datum, nullptr if it wasnt found.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Search(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,FieaGameEngine.Scope**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="125">
<summary>
Search that takes in an key to find and a reference to a Scope pointer. This reference contains the address of the Scope object with the contained key.
</summary>
<param name="string">The key (string) we are trying to search for</param>
<param name="scope">A reference to a Scope*</param>
<returns>Returns the address of the found Datum, nullptr if it wasnt found.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Search(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="133">
<summary>
Const version of Search, Searches for the given key (string), in this Scope, and recursively up its parents.
</summary>
<param name="string">The key (string) we are trying to search for. </param>
<returns>Returns the address of the found (constant) Datum, nullptr if it wasnt found.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Search(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,FieaGameEngine.Scope!System.Runtime.CompilerServices.IsConst**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="140">
<summary>
Const version of Search that takes in an key to find and a reference to a Scope pointer. This reference contains the address of the Scope object with the contained key.
</summary>
<param name="string">The key (string) we are trying to search for</param>
<param name="scope">A reference to a Scope*</param>
<returns>Returns the address of the found (constant) Datum, nullptr if it wasnt found.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Append(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="152">
<summary>
Creates a key Datum pair with the given Scope if the key doesnt exist and returns a reference to that Datum, otherwise it returns a reference to the already existing Datum.
The Datum is Default constructed.
</summary>
<param name="string">The key to Append in the Scope.</param>
<returns>A reference to the Appended/existing Datum.</returns>
</member>
<member name="M:FieaGameEngine.Scope.AppendScope(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="160">
<summary>
Appends a Scope to the given key, if the key exists and is of type Table, or Unkown. If the key doesnt exist create a new key Datum pair with the given key. 
</summary>
<param name="string">The key (string) we are trying to Append a Scope to.</param>
<returns>A reference to the Scope with the given key.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Adopt(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,FieaGameEngine.Scope*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="167">
<summary>
Adopts a Scope from another parent. It cannot be a descendant of the scope you are trying to Adopt to.
</summary>
<param name="string">The key (string) we are creating an enrty of.</param>
<returns>A reference to the child we are trying to Adopt.</returns>
</member>
<member name="M:FieaGameEngine.Scope.GetParent" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="174">
<summary>
Gets the parent of the current Scope.
</summary>
<returns>Returns the address of the parent.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Clear" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="180">
<summary>
Clears all entries stored in this Scope and Deletes any nested Scopes. 
</summary>
</member>
<member name="M:FieaGameEngine.Scope.FindContainedScope(FieaGameEngine.Scope*!System.Runtime.CompilerServices.IsConst)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="185">
<summary>
Finds a Scope contained in this one. 
</summary>
<param name="scope">The contained Scope we are trying to find.</param>
<returns>A pair of Datum*(the address of the found Datum) and an index at which it was found in that Datum. </returns>
</member>
<member name="M:FieaGameEngine.Scope.IsAncestorOf(FieaGameEngine.Scope!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="192">
<summary>
Checks to see if the passed in Scope is a descendant of this one.
</summary>
<param name="scope">The Scope we are querying.</param>
<returns>A boolean as to whether the passed in Scope is a descendant of this Scope.</returns>
</member>
<member name="M:FieaGameEngine.Scope.IsDescendantOf(FieaGameEngine.Scope!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="199">
<summary>
Checks to see if the passed in Scope is an ancestor of this one. 
</summary>
<param name="scope">he Scope we are querying.</param>
<returns>A boolean as to whether the passed in Scope is a ancestor of this Scope.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Equals(FieaGameEngine.RTTI!System.Runtime.CompilerServices.IsConst*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="208">
<summary>
Equals override for an RTTI. Will cast if the given RTTI is really a Scope. Calls the Equality operator for Scopes.
</summary>
<param name="rhs">The other RTTI* we are comparing to this one</param>
<returns>a boolean as to whether the passed in RTTI* is equivalent to this Scope.</returns>
</member>
<member name="T:FieaGameEngine.Signature" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Signature.h" line="7">
<summary>
Signature class for setting up datums in attribute. 
</summary>
</member>
<member name="T:FieaGameEngine.Registry" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Registry.h" line="9">
<summary>
A singleton class that holds a registry of TypeId's to a vector of Signatures.
</summary>
</member>
<member name="M:FieaGameEngine.Registry.GetInstance" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Registry.h" line="16">
<summary>
Retrieves the instance of the singleton.
</summary>
<returns></returns>
</member>
<member name="M:FieaGameEngine.Registry.ClearRegistry" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Registry.h" line="36">
<summary>
Clears the Registry.
</summary>
</member>
<member name="M:FieaGameEngine.Attribute.#ctor(FieaGameEngine.Attribute!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="18">
<summary>
Copy constructor for Attribute.
</summary>
<param name="other">The otherAttribute</param>
</member>
<member name="M:FieaGameEngine.Attribute.op_Assign(FieaGameEngine.Attribute!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="24">
<summary>
Copy assignment operator for Attribute.
</summary>
<param name="other">the other Attribute</param>
<returns>A reference to this Attribute</returns>
</member>
<member name="M:FieaGameEngine.Attribute.#ctor(FieaGameEngine.Attribute*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="31">
<summary>
Move constructor for Attribute.
</summary>
<param name="other">The otherAttribute</param>
</member>
<member name="M:FieaGameEngine.Attribute.op_Assign(FieaGameEngine.Attribute*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="37">
<summary>
Move assignment operator for Attribute.
</summary>
<param name="other">the other Attribute</param>
<returns>A reference to this Attribute</returns>
</member>
<member name="M:FieaGameEngine.Attribute.AppendAuxiliaryAttribute(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="44">
<summary>
Appends an auxiliary Attribute to the Scope.
</summary>
<param name="string">The "key" string we want to append.</param>
<returns>A reference to the newly appended Datum.</returns>
</member>
<member name="M:FieaGameEngine.Attribute.IsAttribute(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="51">
<summary>
A bool as to whether the passed in "key" string is an Attribute.
</summary>
<param name="string">The "key" string we want to append.</param>
<returns>bool as to whether it is an Attribute or not.</returns>
</member>
<member name="M:FieaGameEngine.Attribute.IsPrescribedAttribute(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="58">
<summary>
A bool as to whether the passed in "key" string is a prescribed Attribute (an attribute instantiated at initialization).
</summary>
<param name="string">The "key" string we want to append.</param>
<returns>bool as to whether it is a prescribed Attribute or not.</returns>
</member>
<member name="M:FieaGameEngine.Attribute.IsAuxiliaryAttribute(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="65">
<summary>
A bool as to whether the passed in "key" string is an auxiliary Attribute (an attribute added at runtime).
</summary>
<param name="string">The "key" string we want to append.</param>
<returns>bool as to whether it is an Attribute or not.</returns>
</member>
<member name="M:FieaGameEngine.Attribute.ToString" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="78">
<summary>
To string override for for Attribute.
</summary>
<returns>A string.</returns>
</member>
<member name="M:FieaGameEngine.Attribute.#ctor(System.UInt32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="92">
<summary>
Constructor that takes in a typeID from the child class.
</summary>
<param name="childID">the childs typeID</param>
</member>
<member name="T:FieaGameEngine.Action" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Action.h" line="8">
<summary>
Abstract base class for Action.s
</summary>
</member>
<member name="M:FieaGameEngine.Action.Update(FieaGameEngine.GameTime!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Action.h" line="21">
<summary>
Pure virtual update, overridden in the child classes.
</summary>
<param name="gameTime">A GameTIme instance</param>
</member>
<member name="M:FieaGameEngine.Action.Signatures" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Action.h" line="30">
<summary>
The vector of Signatures, becomes the prescribed Attributes of the GameObject. 
</summary>
<returns></returns>
</member>
<member name="T:FieaGameEngine.ActionIncrement" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="6">
<summary>
Action that increments the value of a target datum (works for int and floats)
</summary>
</member>
<member name="M:FieaGameEngine.ActionIncrement.#ctor" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="13">
<summary>
Default constructor for ActionIncrement, calls Actions Constructor.
</summary>
</member>
<member name="M:FieaGameEngine.ActionIncrement.GetTarget" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="24">
<summary>
Gets the Target string name.
</summary>
<returns>The name of the Target.</returns>
</member>
<member name="M:FieaGameEngine.ActionIncrement.SetTarget(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="30">
<summary>
Sets the name of the Target, resets the cached TargetDatum.
</summary>
<param name="_target"></param>
</member>
<member name="M:FieaGameEngine.ActionIncrement.Update(FieaGameEngine.GameTime!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="36">
<summary>
Update for ActionIncrement, trys to find the Target, and then increments the Targets Datum Value.
</summary>
<param name="gameTime">A GameTime instance.</param>
</member>
<member name="M:FieaGameEngine.ActionIncrement.Clone" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="42">
<summary>
Clones this ActionIncrement, makes a copy that the user is responsible for deleting.
</summary>
<returns>A pointer to a ActionList, the user is responsible for deleting it.</returns>
</member>
<member name="M:FieaGameEngine.ActionIncrement.Equals(FieaGameEngine.RTTI!System.Runtime.CompilerServices.IsConst*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="48">
<summary>
Compares two ActionIncrement to see if they are equal.
</summary>
<param name="rhs">The other RTTI pointer.</param>
<returns>A boolean as to whether they are equal or not.</returns>
</member>
<member name="M:FieaGameEngine.ActionIncrement.ToString" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="55">
<summary>
Converts the ActionIncrement to a string.
</summary>
<returns>A string.</returns>
</member>
<member name="M:FieaGameEngine.ActionIncrement.Signatures" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="61">
<summary>
Vector of Signatures for ActionDestroyAction.
</summary>
<returns>The Vector of Signatures.</returns>
</member>
</members>
</doc>