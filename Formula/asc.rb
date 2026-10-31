# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '6.2.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.2.0/asc_6.2.0_macOS_arm64'
      sha256 '8890173f5502713f8a6e41a48089523f104acf1997cffad462277711b8273b66'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.2.0/asc_6.2.0_macOS_amd64'
      sha256 '5134dd47e400d61d35c71309ffc1555a7b950f1c07e7c0b82fd22de6e9b967a4'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_6.2.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_6.2.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
