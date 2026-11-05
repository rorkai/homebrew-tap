# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '6.5.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.5.0/asc_6.5.0_macOS_arm64'
      sha256 'ab1dfca6777e66c5e5d55b2abe2e8a06f74743be841183575dcd87b11aa9eb6c'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.5.0/asc_6.5.0_macOS_amd64'
      sha256 '455a1944f18f31ffdd9145a1425b88506689ab92d94a92b910a52c0ce85b5de5'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_6.5.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_6.5.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
