project "AudioEngine"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"

	targetdir "bin/%{cfg.buildcfg}/%{prj.name}"
	objdir "bin-int/%{cfg.buildcfg}/%{prj.name}"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS",
		"AL_LIBTYPE_STATIC"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/OpenAL-Soft/include",
		"%{prj.name}/vendor/OpenAL-Soft/src",
		"%{prj.name}/vendor/OpenAL-Soft/src/common"
	}

	liks
	{
		"OpenAL-Soft"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines "UE_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "UE_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Distribuition"
		defines "UE_DISTRIBUITION"
		runtime "Release"
		optimize "on"