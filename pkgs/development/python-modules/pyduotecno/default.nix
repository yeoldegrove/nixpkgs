{ lib
, buildPythonPackage
, fetchFromGitHub
, pythonOlder
, setuptools
, wheel
}:

buildPythonPackage rec {
  pname = "pyduotecno";
  version = "2023.11.0";
  format = "pyproject";

  disabled = pythonOlder "3.9";

  src = fetchFromGitHub {
    owner = "Cereal2nd";
    repo = "pyDuotecno";
    rev = "refs/tags/${version}";
    hash = "sha256-XtNaghYVoE28Dp6YY92SNy0Zw2BxZLYX83EzUSvx/HM=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [
    "duotecno"
  ];

  meta = with lib; {
    description = "Module to interact with Duotecno IP interfaces";
    homepage = "https://github.com/Cereal2nd/pyDuotecno";
    changelog = "https://github.com/Cereal2nd/pyDuotecno/releases/tag/${version}";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
