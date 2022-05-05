#pragma once
//Library.Shared
#include <cstddef>
#include <cstdint>
#include <stdexcept>
#include <functional>
#include <cassert>
#include <memory>
#include <chrono>
#include <algorithm>

// OpenGL Math Lib
#pragma warning(push)
#pragma warning(disable:4201)
#pragma warning(disable:4635)
#pragma warning(disable:26812)
#define GLM_ENABLE_EXPERIMENTAL
#include <json/json.h>
#include <glm/fwd.hpp>
#include <glm/glm.hpp>
#include <glm/gtx/string_cast.hpp>
#pragma warning(pop)
#include <gsl/pointers>

inline std::size_t operator "" _z(unsigned long long int x);
