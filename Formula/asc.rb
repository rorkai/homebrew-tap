# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.7.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.7.1/asc_4.7.1_macOS_arm64'
      sha256 'b0facdac1704c33c9ff5afa96220f2d4c77dc0c1d177084fa13deacd2d34fc4b'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.7.1/asc_4.7.1_macOS_amd64'
      sha256 'ed3a3f65c53d72583e2c53577e2f63d4c1c891d5efcd313c0fef433ec8db93eb'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.7.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.7.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
