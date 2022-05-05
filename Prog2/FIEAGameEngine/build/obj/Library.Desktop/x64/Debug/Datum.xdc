<?xml version="1.0"?><doc>
<members>
<member name="T:FieaGameEngine.DatumTypes" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="13">
<summary>
Enum class of the types that can be stored in the Datum
</summary>
</member>
<member name="T:FieaGameEngine.Datum" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="33">
<summary>
Datum is a Vector that determines its type at runtime.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.#ctor" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="42">
<summary>
Constructor for a Datum.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(FieaGameEngine.DatumTypes,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="46">
<summary>
Constructor for a datum that takes in a type and an optional capacity (defaults to 10).
</summary>
<param name="type">Type for the Datum.</param>
<param name="capacity">Capacity of Datum.</param>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(FieaGameEngine.Datum!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="53">
<summary>
Assigns an already instantiated Datum to another instantiated Datum.
</summary>
<param name="otherDatum">The Datum we are assigning to this one.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(System.Int32!System.Runtime.CompilerServices.IsConst)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="60">
<summary>
Scalar assignment for an int to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The integer value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(System.Single!System.Runtime.CompilerServices.IsConst)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="67">
<summary>
Scalar assignment for a float to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The float value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="74">
<summary>
Scalar assignment for a math vector to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The vector (of 4 floats) value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="81">
<summary>
Scalar assignment for a math matrix to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The matrix (of 16 floats) value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="88">
<summary>
Scalar assignment for a string to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The string value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="95">
<summary>
Scalar assignment for a Run Time Type Information pointer to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The Run Time Type Information pointer value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Dispose" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="103">
<summary>
Destructor for a Datum.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(FieaGameEngine.Datum!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="108">
<summary>
Instantiates a Datum from another one, by copy.
</summary>
<param name="value">The other Datum.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(System.Int32!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="114">
<summary>
Instantiates a Datum from a scalar int.
</summary>
<param name="value">the int value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(System.Single!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="120">
<summary>
Instantiates a Datum from a scalar float.
</summary>
<param name="value">the float value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="126">
<summary>
Instantiates a Datum from a scalar math vector.
</summary>
<param name="value">the math vector value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="132">
<summary>
Instantiates a Datum from a scalar math matrix.
</summary>
<param name="value">the math matrix value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="138">
<summary>
Instantiates a Datum from a scalar string.
</summary>
<param name="value">the string value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="144">
<summary>
Instantiates a Datum from a scalar Run Time Type Information pointer.
</summary>
<param name="value">the Run Time Type Information pointer value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(FieaGameEngine.Datum*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="151">
<summary>
Move copy for a Datum.
</summary>
<param name="otherDatum">The other Datum.</param>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(FieaGameEngine.Datum*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="157">
<summary>
Move assignment for a Datum.
</summary>
<param name="otherDatum">The other Datum.</param>
<returns>A reference to this Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Type" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="164">
<summary>
Returns the type the Datum is.
</summary>
<returns>A constant Datum Type.</returns>
</member>
<member name="M:FieaGameEngine.Datum.SetType(FieaGameEngine.DatumTypes)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="170">
<summary>
Sets the type of the Datum.
</summary>
<param name="type">the type to set the Datum to.</param>
</member>
<member name="M:FieaGameEngine.Datum.Size" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="176">
<summary>
Gets the size of the Datum.
</summary>
<returns>A unsigned integer of the size.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Capacity" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="182">
<summary>
Gets the capacity of the Datum.
</summary>
<returns>A unsigned integer of the capacity.</returns>
</member>
<member name="M:FieaGameEngine.Datum.IsEmpty" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="188">
<summary>
Returns a bool as to whether the Datum is empty or not.
</summary>
<returns>a bool as to whether the Datum is empty or now.</returns>
</member>
<member name="M:FieaGameEngine.Datum.IsExternal" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="194">
<summary>
Returns a bool as to whether the Datum is external or not.
</summary>
<returns>a bool as to whether the Datum is external or now.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Resize(System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="200">
<summary>
Resizes the Datum to the passed in size. Can shrink or grow the Datum.
</summary>
<param name="size">The unsigned int to resize to.</param>
</member>
<member name="M:FieaGameEngine.Datum.Reserve(System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="206">
<summary>
Reserves space to the passed in size, cannot shrink the Datum.
</summary>
<param name="capacity">The unsigned int to resize to.</param>
</member>
<member name="M:FieaGameEngine.Datum.ShrinkToFit" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="212">
<summary>
Shrinks the Datum to the current size.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.Clear" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="217">
<summary>
Clear all elements in the Datum.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(System.Int32*,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="222">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an integer(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(System.Single*,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="229">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an float(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;*,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="236">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an math vector(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;*,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="243">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an math matrix(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;*,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="250">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an string(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(FieaGameEngine.RTTI**,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="257">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an Run Time Type Information pointer(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(FieaGameEngine.Datum!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="264">
<summary>
Equivalence comparison for Datums.
</summary>
<param name="otherDatum">The Datum we are equating to.</param>
<returns>bool as to whether they are the equivelent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(System.Int32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="271">
<summary>
Equivalence comparison for an int. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The int we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(System.Single)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="278">
<summary>
Equivalence comparison for a float. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The float we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="285">
<summary>
Equivalence comparison for a math vector. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The math vector we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="292">
<summary>
Equivalence comparison for a math matrix. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The math matrix we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="299">
<summary>
Equivalence comparison for a string. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The string we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="306">
<summary>
Equivalence comparison for a Run Time Type Information pointer. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The Run Time Type Information pointer we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(FieaGameEngine.Datum!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="313">
<summary>
Non-Equivalence comparison for Datums.
</summary>
<param name="otherDatum">The Datum we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(System.Int32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="320">
<summary>
Non-Equivalence comparison for an int. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The int we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(System.Single)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="327">
<summary>
Non-Equivalence comparison for a float. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The float we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="334">
<summary>
Non-Equivalence comparison for a math vector. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The math vector we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="341">
<summary>
Non-Equivalence comparison for a math matrix. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The math matrix we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="348">
<summary>
Equivalence comparison for a string. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The string we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="355">
<summary>
Equivalence comparison for a Run Time Type Information pointer. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The Run Time Type Information pointer we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Set(System.Int32,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="366">
<summary>
Sets the given int value to the given index of the Datum.
</summary>
<param name="value">The int value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.Set(System.Single,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="373">
<summary>
Sets the given float value to the given index of the Datum.
</summary>
<param name="value">The float value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.Set(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="380">
<summary>
Sets the given math vector value to the given index of the Datum.
</summary>
<param name="value">The math vector value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.Set(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="387">
<summary>
Sets the given math matrix value to the given index of the Datum.
</summary>
<param name="value">The math matrix value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.Set(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="394">
<summary>
Sets the given string value to the given index of the Datum.
</summary>
<param name="value">The string value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.Set(FieaGameEngine.RTTI*,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="401">
<summary>
Sets the given Run Time Type Information pointer value to the given index of the Datum.
</summary>
<param name="value">The Run Time Type Information pointer value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetFromString(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="424">
<summary>
Converts the given string value to the appropriate type, and sets that value to the given index's value of the Datum.
</summary>
<param name="string">The string to set.</param>
<param name="index">The index to set at.</param>
</member>
<member name="M:FieaGameEngine.Datum.ToString(System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="431">
<summary>
Converts the value at the given index (defaults to 0) to a String of appropriate type.
</summary>
<param name="index">The index whose value we are converting to a string.</param>
<returns>The converted string.</returns>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(System.Int32!System.Runtime.CompilerServices.IsConst)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="438">
<summary>
Pushes the int value to the back of the Datum.
</summary>
<param name="value">The int value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(System.Single!System.Runtime.CompilerServices.IsConst)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="444">
<summary>
Pushes the float value to the back of the Datum.
</summary>
<param name="value">The float value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="450">
<summary>
Pushes the math vector value to the back of the Datum.
</summary>
<param name="value">The math vector value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="456">
<summary>
Pushes the math matrix value to the back of the Datum.
</summary>
<param name="value">The math matrix value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="462">
<summary>
Pushes the string value to the back of the Datum.
</summary>
<param name="value">The string value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="468">
<summary>
Pushes the Run Time Type Information pointer value to the back of the Datum.
</summary>
<param name="value">The Run Time Type Information pointer value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PopBack" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="475">
<summary>
Removes the last element of the Datum.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.Remove(System.Int32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="504">
<summary>
Removes the given int value from Datum if it exists in the Datum.
</summary>
<param name="value">The int value to remove.</param>
<returns>A Boolean as to whether the int value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Remove(System.Single)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="511">
<summary>
Removes the given float value from Datum if it exists in the Datum.
</summary>
<param name="value">The float value to remove.</param>
<returns>A Boolean as to whether the float value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Remove(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="518">
<summary>
Removes the given math vector value from Datum if it exists in the Datum.
</summary>
<param name="value">The math vector value to remove.</param>
<returns>A Boolean as to whether the math vector value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Remove(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="525">
<summary>
Removes the given math matrix value from Datum if it exists in the Datum.
</summary>
<param name="value">The math matrix value to remove.</param>
<returns>A Boolean as to whether the math matrix value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Remove(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="532">
<summary>
Removes the given string value from Datum if it exists in the Datum.
</summary>
<param name="value">The string value to remove.</param>
<returns>A Boolean as to whether the string value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Remove(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="539">
<summary>
Removes the given Run Time Type Information pointer value from Datum if it exists in the Datum.
</summary>
<param name="value">The Run Time Type Information pointer value to remove.</param>
<returns>A Boolean as to whether the Run Time Type Information pointer value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.RemoveAt(System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="548">
<summary>
Removes the value at the given index (defaults to 0).
</summary>
<param name="index">The index to remove at.</param>
</member>
<member name="M:FieaGameEngine.Datum.Find(System.Int32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="554">
<summary>
Finds the given int value in the Datum. 
</summary>
<param name="value">The int value.</param>
<returns>A pair type of: boolean as to whether the int value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Find(System.Single)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="561">
<summary>
Finds the given float value in the Datum. 
</summary>
<param name="value">The float value.</param>
<returns>A pair type of: boolean as to whether the float value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Find(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="568">
<summary>
Finds the given math vector value in the Datum. 
</summary>
<param name="value">The math vector value.</param>
<returns>A pair type of: boolean as to whether the math vector value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Find(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="575">
<summary>
Finds the given math matrix value in the Datum. 
</summary>
<param name="value">The math matrix value.</param>
<returns>A pair type of: boolean as to whether the math matrix value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Find(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="582">
<summary>
Finds the given string value in the Datum. 
</summary>
<param name="value">The string value.</param>
<returns>A pair type of: boolean as to whether the string value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Find(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="589">
<summary>
Finds the given Run Time Type Information pointer value in the Datum. 
</summary>
<param name="value">The Run Time Type Information pointer value.</param>
<returns>A pair type of: boolean as to whether the Run Time Type Information pointer value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
</members>
</doc>